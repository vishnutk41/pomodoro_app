import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomodoro_cat/pomodoro_timer.dart';
import 'package:provider/provider.dart';
import 'timer_provider.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(
        360,
        690,
      ), // You can adjust this based on your design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => TimerProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pomodoro Timer',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFFF4EBE4),
                primary: const Color(0xFF4A3728),
                secondary: const Color(0xFFE88D7E),
              ),
              scaffoldBackgroundColor: const Color(0xFFF4EBE4),
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: const PomodoroTimer(),
          ),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Timer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF4EBE4),
          primary: const Color(0xFF4A3728),
          secondary: const Color(0xFFE88D7E),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4EBE4),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF4A3728)),
          bodyMedium: TextStyle(color: Color(0xFF4A3728)),
        ),
      ),
      home: const PomodoroTimer(),
    );
  }
}
