import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:learn_world/constants/constants.dart';
import 'package:learn_world/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
final class AppService {
  const AppService(this.preferences);

  final SharedPreferences preferences;

  (Locale, CustomTheme) get init {
    final localeCode = preferences.getString(AppKeys.localeKey);
    final isDark = preferences.getBool(AppKeys.themeModeKey) ?? false;
    final colorIndex = preferences.getInt(AppKeys.themeColorKey) ?? 0;
    return (
      // ignore: deprecated_member_use
      Locale(localeCode ?? window.locale.languageCode),
      CustomTheme(
        isDark ? Brightness.dark : Brightness.light,
        targetColors[colorIndex] ?? Colors.red,
      ),
    );
  }

  Future<void> setLocale(String langKey) async {
    await preferences.setString(AppKeys.localeKey, langKey);
  }

  Future<void> setPrimaryColor(int colorIndex) async {
    await preferences.setInt(AppKeys.themeColorKey, colorIndex);
  }

  Future<void> setThemeMode({required bool isDark}) async {
    await preferences.setBool(AppKeys.themeModeKey, isDark);
  }
}
