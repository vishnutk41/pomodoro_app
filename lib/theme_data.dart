import 'package:flutter/material.dart';

class AppTheme {
  final Color workBackgroundColor;
  final Color breakBackgroundColor;
  final Color workTimerColor;
  final Color breakTimerColor;
  final Color buttonColor;

  AppTheme({
    required this.workBackgroundColor,
    required this.breakBackgroundColor,
    required this.workTimerColor,
    required this.breakTimerColor,
    required this.buttonColor,
  });
}

class AppThemeData {
  static final List<AppTheme> themes = [
    AppTheme(
      workBackgroundColor: const Color(0xFFF4EDE4),
      breakBackgroundColor: const Color(0xFFE0F7FA),
      workTimerColor: const Color(0xFF5D3B2E),
      breakTimerColor: const Color(0xFF00796B),
      buttonColor: const Color(0xFFE57373),
    ),
    AppTheme(
      workBackgroundColor: const Color(0xFFE8F5E9),
      breakBackgroundColor: const Color(0xFFFFF3E0),
      workTimerColor: const Color(0xFF2E7D32),
      breakTimerColor: const Color(0xFFE65100),
      buttonColor: const Color(0xFF81C784),
    ),
    AppTheme(
      workBackgroundColor: const Color(0xFFE3F2FD),
      breakBackgroundColor: const Color(0xFFFCE4EC),
      workTimerColor: const Color(0xFF1565C0),
      breakTimerColor: const Color(0xFFC2185B),
      buttonColor: const Color(0xFF64B5F6),
    ),
    AppTheme(
      workBackgroundColor: const Color(0xFFF3E5F5),
      breakBackgroundColor: const Color(0xFFFFFDE7),
      workTimerColor: const Color(0xFF6A1B9A),
      breakTimerColor: const Color(0xFFF9A825),
      buttonColor: const Color(0xFFBA68C8),
    ),
    AppTheme(
      workBackgroundColor: const Color(0xFFEFEBE9),
      breakBackgroundColor: const Color(0xFFE0F2F1),
      workTimerColor: const Color(0xFF4E342E),
      breakTimerColor: const Color(0xFF00695C),
      buttonColor: const Color(0xFFA1887F),
    ),
  ];
}