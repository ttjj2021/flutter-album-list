import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.blue,
  primaryTextTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: const Color.fromRGBO(0, 0, 0, 0.87)),
    headline2:
        TextStyle(fontSize: 18.sp, color: const Color.fromRGBO(0, 0, 0, 0.87)),
    caption: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: const Color.fromRGBO(0, 0, 0, 0.63)),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    unselectedItemColor:
        const Color.fromRGBO(0, 0, 0, 0.87), // unselected background
    backgroundColor: const Color(0xFFF6F6F6), // selected background

    unselectedIconTheme:
        IconThemeData(color: const Color.fromRGBO(0, 0, 0, 0.87), size: 24.sp),
    selectedIconTheme: IconThemeData(size: 24.sp),
  ),
);
