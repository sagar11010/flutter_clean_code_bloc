import 'package:flutter/material.dart';

///[AppColors] is contain all most used color in app
class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  //UI COLORS

  static const Color primaryColor = Color(0xff009B9B);
  static Color greybg = const Color(0xffF7F9FA);
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
  static const shadowcolor = Color.fromARGB(66, 34, 34, 34);
  static const Color green = Colors.green;
  static const Color pink = Colors.pink;
  static const Color blue = Colors.blue;
  static const Color lightTextColor = Color.fromARGB(255, 112, 111, 111);
  static const Color red = Colors.red;

  //UI SHADOWS

  static const commonShadow = [
    BoxShadow(
        color: AppColors.shadowcolor,
        offset: Offset(3, 3),
        spreadRadius: 1,
        blurRadius: 9)
  ];
}
