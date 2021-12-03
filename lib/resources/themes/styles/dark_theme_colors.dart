import 'package:flutter/material.dart';
import 'base_styles.dart';

/*
|--------------------------------------------------------------------------
| Dark Theme Colors
|--------------------------------------------------------------------------
*/

class DarkThemeColors implements BaseStyles {
  bool get isDarkTheme => true;
  // general
  Color get background => const Color(0xFF012A4A);
  Color get primaryContent => Colors.white;
  Color get primaryAccent => const Color(0xFF013A63);
  Color get secondaryContent => Color(0xFF0077b6);
  // app bar
  Color get appBarBackground => const Color(0xFF03045e);
  Color get appBarPrimaryContent => Colors.white;

  // buttons
  Color get buttonBackground => Colors.white60;
  Color get buttonPrimaryContent => const Color(0xFF232c33);

  // bottom tab bar
  Color get bottomTabBarBackground => const Color(0xFF232c33);

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected => Color(0xFF0077b6);
  Color get bottomTabBarIconUnselected => Colors.white70;

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected => Color(0xFF0077b6);
  Color get bottomTabBarLabelSelected => Colors.white;
}
