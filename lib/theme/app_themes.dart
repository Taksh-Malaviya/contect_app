import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // primarySwatch: Colors.white,
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
        letterSpacing: 0.6,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // primarySwatch: Colors.brown,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 18.sp,
        color: Colors.green,
        fontWeight: FontWeight.w200,
      ),
      bodyMedium: TextStyle(
        fontSize: 22.sp,
        color: Colors.blueAccent,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 27.sp,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: const TextStyle(
        fontSize: 32,
        color: Colors.redAccent,
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}
