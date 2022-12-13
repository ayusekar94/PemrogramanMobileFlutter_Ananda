import 'package:quran_api/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController with ChangeNotifier {
  static ValueNotifier<bool> isDark = ValueNotifier(false);

  // memberikan data pada theme
  static void setTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isDark.value) {
      isDark.value = false;
      prefs.setBool("darkTheme", false);
    } else {
      isDark.value = true;
      prefs.setBool('darkTheme', true);
    }
    isDark.notifyListeners();
  }

  // menampilkan data theme
  static ThemeData getTheme() {
    if (isDark.value) {
      return themeDark;
    } else {
      return themeLight;
    }
  }

  //
  static themePref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark.value = prefs.getBool("darkTheme") ?? false;
    isDark.notifyListeners();
  }
}