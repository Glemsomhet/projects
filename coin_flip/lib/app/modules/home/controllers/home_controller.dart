import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:coin_flip/app/data/drift_database.dart';
import 'package:drift/drift.dart' as drift;

class HomeController extends GetxController {
  final AppDatabase _db = Get.find<AppDatabase>();

  var result = '...'.obs;
  var isFlipping = false.obs;
  final Random _random = Random();

  var history = <GameHistoryEntry>[].obs;
  var userStats = UserStat(
          id: 1,
          totalFlips: 0,
          headsCount: 0,
          tailsCount: 0,
          bestStreak: 0,
          updatedAt: DateTime.now())
      .obs;

  var currentStreak = 0.obs;
  var currentStreakResult = ''.obs;
  var isVibrationEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    result.value = 'Parayı çevirmek için butona bas.';
    _fetchAndListen();
  }

  Future<void> _fetchAndListen() async {
    // 1. Başlangıç verilerini çek
    var initialStats = await _db.userStatsDao.getStats();

    if (initialStats == null) {
      // Varsayılan istatistikleri oluştur ve kaydet
      final defaultStats = UserStatsCompanion.insert(updatedAt: DateTime.now());
      await _db.userStatsDao.saveStats(defaultStats);
      initialStats = await _db.userStatsDao.getStats();
    }

    userStats.value = initialStats!;

    // 2. Veritabanındaki değişiklikleri dinlemeye başla
    _listenToDatabase();
  }

  void _listenToDatabase() {
    _db.userStatsDao.watchStats().listen((stats) {
      if (stats != null) {
        userStats.value = stats;
      }
    });

    _db.gameHistoryDao.watchAllHistoryEntries().listen((entries) {
      history.value =
          entries.reversed.toList(); // En son atış en başta görünsün
    });
  }

  Future<void> flipCoin() async {
    if (isFlipping.value) return;
    isFlipping.value = true;
    result.value = '...';
    if (isVibrationEnabled.value) Vibration.vibrate();
    await Future.delayed(const Duration(milliseconds: 1500));
    final isHeads = _random.nextBool();
    final uiResult = isHeads ? 'YAZI' : 'TURA';
    result.value = uiResult;
    _updateStreak(uiResult);
    await _addToHistory(uiResult);
    await _updateStats(uiResult);
    if (isVibrationEnabled.value) Vibration.vibrate();
    isFlipping.value = false;
  }

  Future<void> _updateStats(String uiResult) async {
    final newTotalFlips = userStats.value.totalFlips + 1;
    final newHeadsCount = uiResult == 'YAZI'
        ? userStats.value.headsCount + 1
        : userStats.value.headsCount;
    final newTailsCount = uiResult == 'TURA'
        ? userStats.value.tailsCount + 1
        : userStats.value.tailsCount;

    final statsCompanion = UserStatsCompanion(
      id: const drift.Value(1),
      totalFlips: drift.Value(newTotalFlips),
      headsCount: drift.Value(newHeadsCount),
      tailsCount: drift.Value(newTailsCount),
      bestStreak: drift.Value(userStats.value.bestStreak > currentStreak.value
          ? userStats.value.bestStreak
          : currentStreak.value),
      updatedAt: drift.Value(DateTime.now()),
    );
    await _db.userStatsDao.saveStats(statsCompanion);
  }

  void _updateStreak(String result) {
    if (result == currentStreakResult.value) {
      currentStreak.value++;
    } else {
      currentStreakResult.value = result;
      currentStreak.value = 1;
    }
  }

  Future<void> _addToHistory(String result) async {
    final historyCompanion = GameHistoryCompanion(
      result: drift.Value(result),
      playedAt: drift.Value(DateTime.now()),
    );
    await _db.gameHistoryDao.addHistoryEntry(historyCompanion);
  }

  Future<void> resetStats() async {
    currentStreak.value = 0;
    currentStreakResult.value = '';
    await _db.userStatsDao.resetStats();
    await _db.gameHistoryDao.clearHistory();
  }

  var isDarkMode = false.obs;
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
