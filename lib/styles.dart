import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle timerTextStyle({required bool isWorkTime, required Color color}) {
    return TextStyle(
      color: color,
      fontSize: 200.sp,
      fontWeight: FontWeight.bold,
      height: 0.8,
    );
  }

  static TextStyle modeTextStyle({required bool isWorkTime, required Color color}) {
    return TextStyle(
      color: color,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    );
  }
}