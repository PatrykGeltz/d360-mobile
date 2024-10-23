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

  // Input styles

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: lightColors['primary'],
          foregroundColor: lightColors['textPrimary'],

          disabledForegroundColor: lightColors['textSecondary'],
          disabledBackgroundColor: lightColors['secondary']
      )
  ),

  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: lightColors['textPrimary'],
          disabledForegroundColor: lightColors['textSecondary'],
      )
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: lightColors['textPrimary'],
        overlayColor: lightColors['secondary'],
        side: BorderSide(
          color: lightColors['primary'] ?? Colors.transparent, // Border color
        ),

        disabledForegroundColor: lightColors['textSecondary'],
      )
  ),

    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: lightColors['textPrimary'],
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: lightColors['textSecondary'] ?? Colors.transparent,
          width: 2.0,
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: lightColors['textPrimary'] ?? Colors.transparent,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: lightColors['danger'],
          width: 2.0,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: lightColors['danger'],
          width: 2.0,
        ),
      ),
      labelStyle: TextStyle(
        color: lightColors['textPrimary'],
      ),
      hintStyle: TextStyle(
        color: lightColors['textSecondary'],
      ),

    ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightColors['primary']
  ),

  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStatePropertyAll(lightColors['primary']),
    checkColor: WidgetStatePropertyAll(lightColors['textPrimary']),
  )


);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColors['primary']
  ),
  scaffoldBackgroundColor: darkColors['background'],

  // Style of inputs

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColors['primary'],
        foregroundColor: darkColors['textPrimary'],

        disabledForegroundColor: darkColors['textSecondary'],
        disabledBackgroundColor: darkColors['secondary']
      )
  ),

  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: darkColors['textPrimary'],
          disabledForegroundColor: darkColors['textSecondary']
      )
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: darkColors['textPrimary'],
      overlayColor: darkColors['secondary'],
      side: BorderSide(
        color: darkColors['primary'] ?? Colors.transparent, // Border color
      ),

      disabledForegroundColor: darkColors['textSecondary'],
    )
  ),

  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: darkColors['textPrimary'],
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: darkColors['textSecondary'] ?? Colors.transparent,
        width: 2.0,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: darkColors['textPrimary'] ?? Colors.transparent,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: darkColors['danger'],
        width: 2.0,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: darkColors['danger'],
        width: 2.0,
      ),
    ),
    labelStyle: TextStyle(
      color: darkColors['textPrimary'],
    ),
    hintStyle: TextStyle(
      color: darkColors['textSecondary'],
    ),

  ),


    floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkColors['primary']
  ),

  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStatePropertyAll(darkColors['primary']),
    checkColor: WidgetStatePropertyAll(darkColors['textPrimary']),
  )

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