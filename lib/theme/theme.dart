import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'colors.dart';

final lightColors = ThemeColors.light;
final darkColors = ThemeColors.dark;

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColors['primary']
  ),
  scaffoldBackgroundColor: lightColors['background'],
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: lightColors['primary'],
          foregroundColor: lightColors['textPrimary']
      )
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: lightColors['textPrimary']
      )
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightColors['primary']
  )
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColors['primary']
  ),
  scaffoldBackgroundColor: darkColors['background'],

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColors['primary'],
        foregroundColor: darkColors['textPrimary']
      )
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: darkColors['textPrimary']
      )
  ),


  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkColors['primary']
  ),

);


class ThemeDataProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _reverse = false;

  ThemeData getThemeData({bool reverse = false}) {
    if(!reverse) {
      _reverse = false;
      return _isDarkMode ? darkTheme : lightTheme;
    } else {
      _reverse = true;
      return !_isDarkMode ? darkTheme : lightTheme;
    }
  }
  
  IconData getThemeIcon() {
    if (!_reverse) {
      return _isDarkMode ? Icons.light_mode : Icons.dark_mode;
    } else {
      return !_isDarkMode ? Icons.light_mode : Icons.dark_mode;
    }
  }

  void switchTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void initTheme(BuildContext context) {
    _isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}