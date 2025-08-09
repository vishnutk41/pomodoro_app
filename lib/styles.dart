import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle timerTextStyle({required bool isWorkTime}) {
    return TextStyle(
      color: isWorkTime ? const Color(0xFF5D3B2E) : const Color(0xFF00796B),
      fontSize: 200.sp,
      fontWeight: FontWeight.bold,
      height: 0.8, // Reduce the line height
    );
  }

  static TextStyle modeTextStyle({required bool isWorkTime}) {
    return TextStyle(
      color: isWorkTime ? const Color(0xFF5D3B2E) : const Color(0xFF00796B),
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    );
  }
}