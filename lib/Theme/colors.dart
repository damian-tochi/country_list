import 'dart:ui';

import 'package:flutter/material.dart';

Color? textFieldBackground = const Color(0xffFCFDFF);
Color secondaryColor = const Color(0xff01ED19);
Color blackColor = Colors.black;
Color redColor = Colors.red;

class CustomTheme {
  CustomTheme._();

  static const Color scaffoldColor = Color(0xFF000000);
  static const Color almostWhite = Color(0xFFFDFDFD);
  static const Color boxShadow = Color.fromRGBO(237, 239, 241, 0.4);
  static const Color boxShadow2 = Color.fromRGBO(102, 154, 177, 0.32);
  static const Color pink = Color(0xFFEB2B9E);

  static const Color grey = Color.fromRGBO(44, 60, 84, 0.85);
  static const Color grey2 = Color(0xFF939FB0);
  static const Color grey3 = Color(0xFF9CAEB6);
  static const Color grey4 = Color.fromRGBO(112, 124, 141, 0.95);
  static const Color grey5 = Color(0xFF92ACB3);
  static const Color grey6 = Color.fromRGBO(44, 60, 84, 1);
  static const Color grey7 = Color.fromRGBO(112, 124, 141, 0.58);

  static const Color borderGrey = Color(0xFFDADFE7);
  static const Color lightBlue = Color(0xFF4EC3F3);
  static const Color lighterBlue = Color(0xFF4EC2F3);
  static const Color faintBlue = Color(0xFFECF6FB);
  static const Color faintPurple = Color(0xFFE6D7F2);
  static const Color faintGreen = Color(0xFFDFF5EB);
  static const Color faintOrange = Color(0xFFF9DBD4);

  static const Color orange = Color(0xFFC78000);
  static const Color orangeLightTransparent = Color(0x4FC78000);
  static const Color transparentBlack =  Color(0x6F000000);
  static const Color transparentBlackLight =  Color(0x3F000000);
  static const Color transparentBlackLightest =  Color(0x1F000000);
  static const Color transparentBlacker =  Color(0x8F000000);
  static const Color transparentBlackest =  Color(0x9F000000);
  static const Color fullTransparent =  Color(0x00000000);
  static const Color lightGreen =  Color(0x5F02AA63);
  static const Color lightPurple =  Color(0x5F8048FF);
  static const Color lightRed =  Color(0x9FF72727);
  static const Color lightYellow =  Color(0x5FE68C00);


  static const Color header1 = Color(0xFFFDDBC6);
  static const Color header2 = Color(0x9F808080);
  static const Color header3 = Color(0xFFFDFEFF);


  static const orangeAccent = MaterialAccentColor(
    0xFFC78000,
    <int, Color>{
      100: Color(0xFFC78000),
      200: Color(0xFFC78000),
      400: Color(0xFFC78000),
      700: Color(0xFFC78000),
    },
  );

  static const blackAccent = MaterialAccentColor(
    0xFF080808,
    <int, Color>{
      100: Color(0xFF080808),
      200: Color(0x6F080808),
      400: Color(0x9F000000),
      700: Color(0xFF080808),
    },
  );

  static const TextStyle title = TextStyle(color: grey, fontSize: 36);
  static const TextStyle titleLight = TextStyle(color: grey, fontSize: 14);
  static const TextStyle title2 = TextStyle(color: grey6, fontSize: 16, fontWeight: FontWeight.w600);
  static const TextStyle bodyText = TextStyle(color: grey2, fontSize: 16);
  static const TextStyle buttonText = TextStyle(color: almostWhite, fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle greenText = TextStyle(color: lightGreen, fontSize: 14, fontWeight: FontWeight.bold);
  static const TextStyle subtitle = TextStyle(color: grey3, fontSize: 14);
  static const TextStyle subtitle2 = TextStyle(color: grey4, fontSize: 14, fontWeight: FontWeight.w600);
  static const TextStyle subtitleLight = TextStyle(color: grey4, fontSize: 10);
  static const TextStyle label = TextStyle(color: grey6, fontSize: 12, fontWeight: FontWeight.w700);
  static const TextStyle labelLight = TextStyle(color: grey7, fontSize: 12);

  static const TextStyle headerText = TextStyle(color: header1, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle headerText2 = TextStyle(color: header3, fontSize: 14);
  static const TextStyle authButton = TextStyle(color: scaffoldColor, fontSize: 12, fontWeight: FontWeight.bold);

  static const Color gray = Color(0x8FFCFCFC);
  static const Color dropDownIconColor = Color(0xFFFDDBC6);


}


/// Theme extension for providing style for the search bar used on mobile devices.
class SearchBarThemeData extends ThemeExtension<SearchBarThemeData> {
  final BorderRadius borderRadius;
  final Color accentColor;
  final Color backgroundColor;
  final Color shadowColor;
  final double elevation;
  final TextStyle? hintStyle;
  final TextStyle? queryStyle;

  SearchBarThemeData({
    required this.borderRadius,
    required this.accentColor,
    required this.backgroundColor,
    required this.shadowColor,
    required this.elevation,
    required this.hintStyle,
    required this.queryStyle,
  });

  @override
  ThemeExtension<SearchBarThemeData> copyWith({
    BorderRadius? borderRadius,
    Color? accentColor,
    Color? backgroundColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? hintStyle,
    TextStyle? queryStyle,
  }) {
    return SearchBarThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
      accentColor: accentColor ?? this.accentColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      hintStyle: hintStyle ?? this.hintStyle,
      queryStyle: queryStyle ?? this.queryStyle,
    );
  }

  @override
  ThemeExtension<SearchBarThemeData> lerp(
      ThemeExtension<SearchBarThemeData>? other,
      double t,
      ) {
    if (other is! SearchBarThemeData) {
      return this;
    }
    return SearchBarThemeData(
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      elevation: lerpDouble(elevation, other.elevation, t)!,
      hintStyle: TextStyle.lerp(hintStyle, other.hintStyle, t)!,
      queryStyle: TextStyle.lerp(queryStyle, other.queryStyle, t)!,
    );
  }
}

