import 'package:flutter/cupertino.dart';

class AppConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static bool fullscreen = false;
  static bool menuRecolhido = false;
  
  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static bool get isMobile => screenWidth < 850;
  static bool get isTablet => screenWidth >= 850 && screenWidth < 1100;
  static bool get isDesktop => screenWidth >= 1100;

  static void updateScreenSize(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static double getWidth(double percent) {
    /*print('width 1: $screenWidth');
    print('width 2: ${screenWidth*(percent/100)}');*/
    return screenWidth*(percent/100);
  }
  static double getHeight(double percent) {
    return screenHeight*(percent/100);
  }
}