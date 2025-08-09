import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class TimerProvider with ChangeNotifier {
  static const int workDuration = 25 * 60; // 25 minutes
  static const int breakDuration = 5 * 60; // 5 minutes

  int _remainingTime = workDuration;
  bool _isRunning = false;
  bool _isWorkTime = true;
  Timer? _timer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  int get remainingTime => _remainingTime;
  bool get isRunning => _isRunning;
  bool get isWorkTime => _isWorkTime;

  void toggleTimer() {
    if (_isRunning) {
      stopTimer();
    } else {
      startTimer();
    }
  }

  void resetTimer() {
    stopTimer();
    _remainingTime = _isWorkTime ? workDuration : breakDuration;
    notifyListeners();
  }

  void switchToWork() {
    stopTimer();
    _isWorkTime = true;
    _remainingTime = workDuration;
    notifyListeners();
  }

  void switchToBreak() {
    stopTimer();
    _isWorkTime = false;
    _remainingTime = breakDuration;
    notifyListeners();
  }

  void startTimer() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
      notifyListeners();
    }
  }

  void _tick() {
    if (_remainingTime > 0) {
      _remainingTime--;
      if (_remainingTime == 30) {
        _playAudio();
      }
      notifyListeners();
    } else {
      stopTimer();
    }
  }

  void stopTimer() {
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  Future<void> _playAudio() async {
    await _audioPlayer.play(AssetSource('audio/timer_over.mp3'));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }
}