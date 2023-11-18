import 'package:flutter/material.dart';

class CustomTheme {
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.indigo,
    onPrimary: Color(0xffFAFAFA),
    secondary: Color(0xffF36666),
    onSecondary: Color(0xffFFE5E2),
    background: Color(0xff303030),
    onBackground: Color(0xffFDFDFD),
    surface: Color(0xff1D1D1D),
    onSurface: Color(0xff4D4D4D),
    error: Color(0xffFF4E3D),
    onError: Color(0xff692C26),
    tertiaryContainer: Color.fromARGB(255, 35, 33, 33),
  );

  static final _baseTextStyle = TextStyle(
    color: colorScheme.onPrimary,
    decoration: TextDecoration.none,
    leadingDistribution: TextLeadingDistribution.even,
    letterSpacing: 0,
  );

  static TextTheme textTheme = TextTheme(
    titleLarge: _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25,
    ),
    bodyLarge: _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    bodyMedium: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    bodySmall: _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.2,
    ),
  );
}
