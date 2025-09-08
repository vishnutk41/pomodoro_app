import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'timer_provider.dart';
import 'pomodoro_timer.dart';
import 'theme_data.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance(); // Initialize SharedPreferences
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Consumer<TimerProvider>(
          builder: (context, timerProvider, _) {
            final theme = timerProvider.currentTheme;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Pomodoro Timer',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: theme.workBackgroundColor,
                  primary: theme.workTimerColor,
                  secondary: theme.buttonColor,
                ),
                scaffoldBackgroundColor: theme.workBackgroundColor,
                textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => const SplashScreen(),
                '/home': (context) => const PomodoroTimer(),
              },
            );
          },
        );
      },
    );
  }
}