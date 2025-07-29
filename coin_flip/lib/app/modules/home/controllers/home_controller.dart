import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;

  // --- Core Coin Flip Logic ---
  var result = '...'.obs;
  var isFlipping = false.obs;
  final Random _random = Random();

  // --- Feature Controllers ---
  var history = <String>[].obs;

  // --- Statistics ---
  var yaziCount = 0.obs;
  var TuraCount = 0.obs;
  var totalFlips = 0.obs;

  // --- Streak Counter ---
  var currentStreak = 0.obs;
  var currentStreakResult = ''.obs;
  var longestStreak = 0.obs;

  // --- Settings (will be moved to a settings service later) ---
  var isVibrationEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    result.value = 'Parayı çevirmek için butona bas.';
    print("HomeController initialized. Fetching initial data...");
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        print("Fetch failed: User is not logged in.");
        return;
      }
      print("Fetching data for user: $userId");

      final statsResponse = await supabase
          .from('user_stats')
          .select()
          .eq('user_id', userId)
          .single();

      print("Stats data fetched: $statsResponse");
      yaziCount.value = statsResponse['heads_count'] ?? 0;
      TuraCount.value = statsResponse['tails_count'] ?? 0;
      totalFlips.value = statsResponse['total_flips'] ?? 0;
      longestStreak.value = statsResponse['best_streak'] ?? 0;

      final historyResponse = await supabase
          .from('game_history')
          .select('result')
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .limit(10);

      print("History data fetched: $historyResponse");
      history.value = historyResponse
          .map<String>((row) => row['result'] as String)
          .toList();
    } catch (e) {
      print('Error fetching initial data: $e');
    }
  }

  Future<void> flipCoin() async {
    if (isFlipping.value) return;

    isFlipping.value = true;
    result.value = '...';

    if (isVibrationEnabled.value) {
      Vibration.vibrate();
    }

    // Animation Duration
    await Future.delayed(const Duration(milliseconds: 1500));

    final isHeads = _random.nextBool();
    final dbResult = isHeads ? 'heads' : 'tails';
    result.value = isHeads ? 'YAZI' : 'TURA';

    await _updateStats(dbResult);
    _updateStreak(result.value); // Pass the UI value to streak logic
    _addToHistory(result.value); // Pass the UI value to history

    if (isVibrationEnabled.value) {
      Vibration.vibrate();
    }

    isFlipping.value = false;
  }

  Future<void> _updateStats(String dbResult) async {
    // This logic no longer directly depends on the result string
    totalFlips.value++;
    if (dbResult == 'heads') {
      yaziCount.value++;
    } else {
      TuraCount.value++;
    }

    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        print("Stat update failed: User is not logged in.");
        return;
      }
      print("Updating stats for user: $userId with result: $dbResult");

      print("Inserting into game_history...");
      await supabase.from('game_history').insert({
        'user_id': userId,
        'result': dbResult,
      });
      print("Insertion complete.");

      print("Upserting user_stats...");
      await supabase.from('user_stats').upsert({
        'user_id': userId,
        'total_flips': totalFlips.value,
        'heads_count': yaziCount.value,
        'tails_count': TuraCount.value,
        'best_streak': longestStreak.value,
        'updated_at': DateTime.now().toIso8601String(),
      });
      print("Upsert complete.");
    } catch (e) {
      print('Error updating stats: $e');
    }
  }

  void _updateStreak(String result) {
    if (result == currentStreakResult.value) {
      currentStreak.value++;
    } else {
      currentStreakResult.value = result;
      currentStreak.value = 1;
    }

    if (currentStreak.value > longestStreak.value) {
      longestStreak.value = currentStreak.value;
    }
  }

  void _addToHistory(String result) {
    history.insert(0, result);
    if (history.length > 10) {
      history.removeLast();
    }
  }

  Future<void> resetStats() async {
    yaziCount.value = 0;
    TuraCount.value = 0;
    totalFlips.value = 0;
    currentStreak.value = 0;
    currentStreakResult.value = '';
    longestStreak.value = 0;
    history.clear();

    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        print("Reset failed: User is not logged in.");
        return;
      }
      print("Resetting stats for user: $userId");

      await supabase.from('game_history').delete().eq('user_id', userId);
      print("Game history for user $userId deleted.");

      await supabase.from('user_stats').upsert({
        'user_id': userId,
        'total_flips': 0,
        'heads_count': 0,
        'tails_count': 0,
        'best_streak': 0,
        'updated_at': DateTime.now().toIso8601String(),
      });
      print("User stats for user $userId reset.");
    } catch (e) {
      print('Error resetting stats: $e');
    }
  }

  // --- Theme Logic ---
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
