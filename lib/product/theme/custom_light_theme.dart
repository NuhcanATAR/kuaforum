import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/theme/custom_theme.dart';
import 'package:kuaforum/product/theme/main_theme.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.roboto().fontFamily,
      colorScheme: CustomColorScheme.lightColorScheme,
      floatingActionButtonTheme: floatingActionButtonThemeData,
      appBarTheme: appBarTheme,
      textTheme: TextTheme(
        labelMedium: TextStyle(color: ColorBackgroundConstant.redDarker),
      ));

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();

  @override
  AppBarTheme get appBarTheme => const AppBarTheme();
}
