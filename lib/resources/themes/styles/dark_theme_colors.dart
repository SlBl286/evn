import 'package:flutter/material.dart';
import 'base_styles.dart';

/*
|--------------------------------------------------------------------------
| Dark Theme Colors
|--------------------------------------------------------------------------
*/

class DarkThemeColors implements BaseStyles {
  // general
  Color get background => const Color(0xFF012A4A);
  Color get primaryContent => const Color(0xFFA9D6E5);
  Color get primaryAccent => const Color(0xFF013A63);
  Color get secondaryContent => Color(0xFF74c69d);
  // app bar
  Color get appBarBackground => const Color(0xFF012A4A);
  Color get appBarPrimaryContent => const Color(0xFFA9D6E5);

  // buttons
  Color get buttonBackground => Colors.white60;
  Color get buttonPrimaryContent => const Color(0xFF232c33);

  // bottom tab bar
  Color get bottomTabBarBackground => const Color(0xFF232c33);

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected => Colors.white70;
  Color get bottomTabBarIconUnselected => Colors.white60;

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected => Colors.white54;
  Color get bottomTabBarLabelSelected => Colors.white;
}
