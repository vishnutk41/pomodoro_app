import 'package:flutter/material.dart';
import 'dart:async';

class TimerProvider with ChangeNotifier {
  static const int workDuration = 25 * 60; // 25 minutes
  static const int breakDuration = 5 * 60; // 5 minutes

  int _remainingTime = workDuration;
  bool _isRunning = false;
  bool _isWorkTime = true;
  Timer? _timer;

  int get remainingTime => _remainingTime;
  bool get isRunning => _isRunning;
  bool get isWorkTime => _isWorkTime;

  void startTimer() {
    if (_isRunning) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
      } else {
        _toggleWorkBreak();
      }
      notifyListeners();
    });

    _isRunning = true;
    notifyListeners();
  }

  void stopTimer() {
    _timer?.cancel();
    _isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    _timer?.cancel();
    _remainingTime = workDuration;
    _isRunning = false;
    _isWorkTime = true;
    notifyListeners();
  }

  void switchToBreak() {
    _timer?.cancel();
    _remainingTime = breakDuration;
    _isRunning = false;
    _isWorkTime = false;
    notifyListeners();
  }

  void switchToWork() {
    _timer?.cancel();
    _remainingTime = workDuration;
    _isRunning = false;
    _isWorkTime = true;
    notifyListeners();
  }

  void _toggleWorkBreak() {
    _isWorkTime = !_isWorkTime;
    _remainingTime = _isWorkTime ? workDuration : breakDuration;
    notifyListeners();
  }
}