import 'package:flutter/material.dart';

final BorderRadius radius = BorderRadius.circular(6.0);

final ThemeData appTheme = ThemeData(
  fontFamily: 'Aeonik',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xff0249FD),
  hintColor: Colors.grey[400],

  ///appBar theme
  appBarTheme: const AppBarTheme(
    color: Color(0xff0249FD),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
  ),

  ///text theme
  textTheme: TextTheme(
    bodyLarge: const TextStyle(),
    bodyMedium: const TextStyle(fontWeight: FontWeight.w400),
    titleMedium: const TextStyle(fontWeight: FontWeight.w500),
    titleSmall: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w400),
  ).apply(bodyColor: Colors.black),
  colorScheme: ColorScheme.fromSwatch(backgroundColor: const Color(0xfff3f5f5)),
);

const TextStyle bottomBarTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// titleLarge    20.0  medium   0.15
/// titleMedium    16.0  regular  0.15
/// titleSmall    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyLarge)
/// body2        14.0  regular  0.25  (bodyMedium)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
