import 'package:flutter/material.dart';
import 'base_styles.dart';

/*
|--------------------------------------------------------------------------
| Light Theme Colors
|--------------------------------------------------------------------------
*/

class LightThemeColors implements BaseStyles {
  bool get isDarkTheme => false;
  // general
  Color get background => const Color(0xFFcaf0f8);
  Color get primaryContent => Color(0xFFF2F2F2);
  Color get secondaryContent => Color(0xFF00b4d8);
  Color get primaryAccent => const Color(0xFF0077b6);

  // app bar
  Color get appBarBackground => const Color(0xFF0077b6);
  Color get appBarPrimaryContent => const Color(0xFFF2F2F2);

  // buttons
  Color get buttonBackground => Color(0xFFa5a5a5);
  Color get buttonPrimaryContent => Colors.white;

  // bottom tab bar
  Color get bottomTabBarBackground => Colors.white;

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected => Colors.blue;
  Color get bottomTabBarIconUnselected => Colors.black54;

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected => Colors.black45;
  Color get bottomTabBarLabelSelected => Colors.black;
}
