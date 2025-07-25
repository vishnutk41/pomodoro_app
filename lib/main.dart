import 'package:flutter/material.dart';
import 'package:pomodoro_cat/pomodoro_timer.dart';
import 'package:provider/provider.dart';
import 'timer_provider.dart';
  
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TimerProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const PomodoroTimer(),
    );
  }
}
 