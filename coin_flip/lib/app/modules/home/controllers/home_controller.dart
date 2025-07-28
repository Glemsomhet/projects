import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:simple_animations/simple_animations.dart';

class HomeController extends GetxController {
  // --- Core Coin Flip Logic ---
  var result = '...'.obs;
  var isFlipping = false.obs;
  final Random _random = Random();

  // --- Feature Controllers ---
  final AudioPlayer _audioPlayer = AudioPlayer();
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
  var isSoundEnabled = true.obs;
  var isVibrationEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    result.value = 'Parayı çevirmek için butona bas.';
  }

  Future<void> flipCoin() async {
    if (isFlipping.value) return;

    isFlipping.value = true;
    result.value = '...';

    if (isSoundEnabled.value) {
      _playSound('flip.mp3');
    }
    if (isVibrationEnabled.value) {
      Vibrate.feedback(FeedbackType.light);
    }

    // Animation Duration
    await Future.delayed(const Duration(milliseconds: 1500));

    final coinResult = _random.nextInt(2) == 0 ? 'yazi' : 'Tura';
    result.value = coinResult;

    _updateStats(coinResult);
    _updateStreak(coinResult);
    _addToHistory(coinResult);

    if (isSoundEnabled.value) {
      _playSound('result.mp3');
    }
    if (isVibrationEnabled.value) {
      Vibrate.feedback(FeedbackType.success);
    }

    isFlipping.value = false;
  }

  void _updateStats(String result) {
    totalFlips.value++;
    if (result == 'yazi') {
      yaziCount.value++;
    } else {
      TuraCount.value++;
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

  void resetStats() {
    yaziCount.value = 0;
    TuraCount.value = 0;
    totalFlips.value = 0;
    currentStreak.value = 0;
    currentStreakResult.value = '';
    longestStreak.value = 0;
    history.clear();
  }

  Future<void> _playSound(String soundFile) async {
    try {
      await _audioPlayer.play(AssetSource('audio/$soundFile'));
    } catch (e) {
      // Handle exception (e.g., file not found)
      print("Error playing sound: $e");
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
    _audioPlayer.dispose();
    super.onClose();
  }
}
