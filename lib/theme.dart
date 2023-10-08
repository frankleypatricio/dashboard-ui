import 'package:flutter/material.dart';

class AppTheme {
  static const colorScheme = ColorScheme.dark(
    primary: Color(0xFF2697FF),
    onPrimary: Colors.white,
    secondary: Color(0xFF2A2D3E),
    onSecondary: Colors.white,
    background: Color(0xFF212332),
    onBackground: Colors.white,
  );

  static final themeData = ThemeData.dark().copyWith(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.background,

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    ),

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      focusColor: colorScheme.onBackground,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
      errorBorder: outlineInputBorder,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.secondary,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  static OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
    gapPadding: 1,
    borderSide: BorderSide(width: 1, color: colorScheme.onSurface),
    borderRadius: BorderRadius.circular(30),
  );
}