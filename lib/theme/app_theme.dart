import 'package:flutter/material.dart';
import 'colors.dart';

@immutable
class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
        scaffoldBackgroundColor: Color(0xFF1C1C1E),
        backgroundColor: Color(0xFF1C1C1E),
        appBarTheme: AppBarTheme(color: Color(0xFFFFD60A)),
        fontFamily: 'SF Pro Text Regular',
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent);
  }
}
