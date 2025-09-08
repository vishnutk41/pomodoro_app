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
    // 1. Royal Blue + Gold (Luxurious & Professional)
    AppTheme(
      workBackgroundColor: const Color(0xFF0D47A1), // Royal Blue
      breakBackgroundColor: const Color(0xFFFFD700), // Gold
      workTimerColor: const Color(0xFFFFFFFF),
      breakTimerColor: const Color(0xFF1A237E), 
      buttonColor: const Color(0xFFFFC107), // Golden Yellow
    ),

    // 2. Emerald + Champagne (Classy & Calming)
    AppTheme(
      workBackgroundColor: const Color(0xFF00695C), // Emerald Green
      breakBackgroundColor: const Color(0xFFFFF8E1), // Champagne
      workTimerColor: const Color(0xFFFFFFFF),
      breakTimerColor: const Color(0xFF004D40),
      buttonColor: const Color(0xFF26A69A), // Aqua Green
    ),

    // 3. Burgundy + Rose Gold (Elegant & Romantic)
    AppTheme(
      workBackgroundColor: const Color(0xFF4A0E0E), // Deep Burgundy
      breakBackgroundColor: const Color(0xFFFFE4E1), // Soft Rose
      workTimerColor: const Color(0xFFFFCDD2),
      breakTimerColor: const Color(0xFF3E2723),
      buttonColor: const Color(0xFFD4A5A5), // Rose Gold
    ),

    // 4. Midnight Navy + Silver (Modern & Sophisticated)
    AppTheme(
      workBackgroundColor: const Color(0xFF0A192F), // Midnight Navy
      breakBackgroundColor: const Color(0xFF90A4AE), // Silver Grey
      workTimerColor: const Color(0xFFFFFFFF),
      breakTimerColor: const Color(0xFF212121),
      buttonColor: const Color(0xFFB0BEC5), // Metallic Silver
    ),

    // 5. Deep Teal + Coral (Trendy & Stylish)
    AppTheme(
      workBackgroundColor: const Color(0xFF004D40), // Deep Teal
      breakBackgroundColor: const Color(0xFFFF7043), // Coral
      workTimerColor: const Color(0xFFFFFFFF),
      breakTimerColor: const Color(0xFFFFFFFF),
      buttonColor: const Color(0xFF26C6DA), // Aqua Accent
    ),
  ];
}
