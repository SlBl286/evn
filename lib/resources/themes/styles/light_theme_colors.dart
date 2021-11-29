import 'package:flutter/material.dart';
import 'base_styles.dart';

/*
|--------------------------------------------------------------------------
| Light Theme Colors
|--------------------------------------------------------------------------
*/

class LightThemeColors implements BaseStyles {
  // general
  Color get background => const Color(0xFFA9D6E5);
  Color get primaryContent => Color(0xFF012A4A);
  Color get secondaryContent => Color(0xFF74c69d);
  Color get primaryAccent => const Color(0xFF61A5C2);

  // app bar
  Color get appBarBackground => const Color(0xFF89C2D9);
  Color get appBarPrimaryContent => const Color(0xFF012A4A);

  // buttons
  Color get buttonBackground => Color(0xFF89C2D9);
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
