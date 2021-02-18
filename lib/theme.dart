import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    unselectedWidgetColor: Colors.blue[600],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 2,
      foregroundColor: Colors.blue[700],
      backgroundColor: Colors.white,
    ),
  );
}
