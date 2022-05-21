import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final appTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.87), // unselected background
    backgroundColor: Color(0xFFF6F6F6), // selected background

    unselectedIconTheme:
        IconThemeData(color: Color.fromRGBO(0, 0, 0, 0.87), size: 24.sp),
    selectedIconTheme: IconThemeData(size: 24.sp),
  ),
);
