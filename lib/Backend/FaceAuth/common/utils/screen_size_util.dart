import 'package:flutter/material.dart';

class ScreenSizeUtil {
  static late BuildContext context;

  static double get screenHeight => MediaQuery.of(context).size.height;
  static double get screenWidth => MediaQuery.of(context).size.width;
}

