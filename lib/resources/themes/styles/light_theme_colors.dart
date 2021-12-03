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
  Color get background => const Color(0xFFF2F2F2);
  Color get primaryContent => Color(0xFF03045e);
  Color get secondaryContent => Color(0xFFF2F2F2);
  Color get primaryAccent => const Color(0xFF0096c7);

  // app bar
  Color get appBarBackground => const Color(0xFF0077b6);
  Color get appBarPrimaryContent => const Color(0xFFF2F2F2);

  // buttons
  Color get buttonBackground => Color(0xFFa5a5a5);
  Color get buttonPrimaryContent => Colors.white;

  // bottom tab bar
  Color get bottomTabBarBackground => Colors.white;

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected => Color(0xFF0077b6);
  Color get bottomTabBarIconUnselected => Colors.black54;

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected => Color(0xFF0077b6);
  Color get bottomTabBarLabelSelected => Colors.black;
}
