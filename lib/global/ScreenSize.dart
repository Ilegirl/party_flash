import 'package:flutter/material.dart';

class ScreenSize {
  static double iPhoneSEWidth = 400;
  static double mobileWidth = 500;
  static late Size screenSize;
  static late double screenWidth;
  static late double screenHeight;
  static double _pageWidth = 0;
  static double _utilWidth = 0;

  static void init(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
  }

  static double scaleWidth(BuildContext context) {
    _pageWidth = MediaQuery.of(context).size.width;
    _utilWidth = _pageWidth > mobileWidth ? 1000 :
    ( iPhoneSEWidth > mobileWidth ? 500 : 600);
    final diff = screenWidth / _utilWidth;
    return diff;
  }
}