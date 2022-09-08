import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static final ThemeData appTheme = ThemeData.light()
      .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo));
}
