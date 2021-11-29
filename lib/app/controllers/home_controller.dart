import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/app/models/theme.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller.dart';

class HomeController extends Controller {
  ThemeMode? currentTheme;
  @override
  construct(BuildContext context) {}

  getCurrentTheme() async {
    if (currentTheme == null) {
      currentTheme = ThemeMode.system;
    }
  }
}
