import 'dart:ui';

import 'package:flutter/material.dart';

import '../Consts/global_func.dart';

Color? textFieldBackground = const Color(0xffFCFDFF);
Color secondaryColor = const Color(0xff01ED19);
Color blackColor = Colors.black;
Color redColor = Colors.red;

Color primaryColor = HexColor.fromHex('#ED1819');
Color primaryLight = HexColor.fromHex('#FACACA');
Color primaryDark = HexColor.fromHex('#990F0F');


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
  static const Color uduBlack =  Color(0xFF0D0D0D);
  static const Color uduBlackish =  Color(0xFF121212);
  static const Color uduBlackishing =  Color(0xFF212122);
  static const Color fullTransparent =  Color(0x00000000);
  static const Color lightGreen =  Color(0x5F02AA63);
  static const Color lightPurple =  Color(0x5F8048FF);
  static const Color lightRed =  Color(0x9FF72727);
  static const Color lightYellow =  Color(0x5FE68C00);


  static const Color header1 = Color(0xFFFDDBC6);
  static const Color header2 = Color(0x9F808080);
  static const Color header3 = Color(0xFFFDFEFF);

  static final colorM = HexColor.fromHex('#000000');

  static final currTextColour = HexColor.fromHex('#59616D');

  static const uduYellowAccent = MaterialAccentColor(
    0xFFC78000,
    <int, Color>{
      100: Color(0xFFC78000),
      200: Color(0xFFC78000),
      400: Color(0xFFC78000),
      700: Color(0xFFC78000),
    },
  );

  static const uduBlackAccent = MaterialAccentColor(
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


  static final colorBlack = HexColor.fromHex('#FFFFFF');
  static const Color gray = Color(0x8FFCFCFC);
  static const Color dropDownIconColor = Color(0xFFFDDBC6);


}


class MaterialRoute extends MaterialPageRoute {
  MaterialRoute({required super.builder});

  /// Reference to the [AnimationDuration] instance registered in the [ThemeData] as [ThemeExtension].
  static AnimationDuration? animationDuration;

  /// Default transition duration for the [MaterialRoute].
  static const kDefaultTransitionDuration = Duration(milliseconds: 300);

  @override
  Duration get transitionDuration =>
      animationDuration?.medium ?? kDefaultTransitionDuration;
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


class MaterialStandard extends ThemeExtension<MaterialStandard> {
  final int value;

  const MaterialStandard(this.value);

  @override
  ThemeExtension<MaterialStandard> copyWith({int? value}) {
    return MaterialStandard(value ?? this.value);
  }

  @override
  ThemeExtension<MaterialStandard> lerp(
      ThemeExtension<MaterialStandard>? other,
      double t,
      ) {
    if (other is! MaterialStandard) {
      return this;
    }
    return MaterialStandard(other.value);
  }
}


class AnimationDuration extends ThemeExtension<AnimationDuration> {
  final Duration fast;
  final Duration medium;
  final Duration slow;

  const AnimationDuration({
    this.fast = const Duration(milliseconds: 150),
    this.medium = const Duration(milliseconds: 300),
    this.slow = const Duration(milliseconds: 450),
  });

  factory AnimationDuration.fromJson(Map<String, dynamic> json) {
    return AnimationDuration(
      fast: Duration(milliseconds: json['fast'] as int),
      medium: Duration(milliseconds: json['medium'] as int),
      slow: Duration(milliseconds: json['slow'] as int),
    );
  }

  factory AnimationDuration.disabled() {
    return const AnimationDuration(
      fast: Duration.zero,
      medium: Duration.zero,
      slow: Duration.zero,
    );
  }

  @override
  ThemeExtension<AnimationDuration> copyWith({
    bool? enabled,
    Duration? fast,
    Duration? medium,
    Duration? slow,
  }) {
    return AnimationDuration(
      fast: fast ?? this.fast,
      medium: medium ?? this.medium,
      slow: slow ?? this.slow,
    );
  }

  @override
  ThemeExtension<AnimationDuration> lerp(
      ThemeExtension<AnimationDuration>? other,
      double t,
      ) {
    if (other is! AnimationDuration) {
      return this;
    }
    return AnimationDuration(
      fast: fast * (1 - t) + other.fast * t,
      medium: medium * (1 - t) + other.medium * t,
      slow: slow * (1 - t) + other.slow * t,
    );
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnimationDuration &&
        other.fast == fast &&
        other.medium == medium &&
        other.slow == slow;
  }

  @override
  int get hashCode => fast.hashCode ^ medium.hashCode ^ slow.hashCode;

  @override
  String toString() {
    return 'AnimationDuration(fast: $fast, medium: $medium, slow: $slow)';
  }

  Map<String, int> toJson() {
    return {
      'fast': fast.inMilliseconds,
      'medium': medium.inMilliseconds,
      'slow': slow.inMilliseconds,
    };
  }
}

/// Theme extension for providing various text colors independent of the the current [Brightness].
class TextColors extends ThemeExtension<TextColors> {
  final Color lightPrimary;
  final Color darkPrimary;
  final Color lightSecondary;
  final Color darkSecondary;

  const TextColors(
      this.lightPrimary,
      this.darkPrimary,
      this.lightSecondary,
      this.darkSecondary,
      );

  @override
  ThemeExtension<TextColors> copyWith({
    Color? lightPrimary,
    Color? darkPrimary,
    Color? lightSecondary,
    Color? darkSecondary,
  }) {
    return TextColors(
      lightPrimary ?? this.lightPrimary,
      darkPrimary ?? this.darkPrimary,
      lightSecondary ?? this.lightSecondary,
      darkSecondary ?? this.darkSecondary,
    );
  }

  @override
  ThemeExtension<TextColors> lerp(
      ThemeExtension<TextColors>? other,
      double t,
      ) {
    if (other is! TextColors) {
      return this;
    }
    return TextColors(
      Color.lerp(
        lightPrimary,
        other.lightPrimary,
        t,
      ) ??
          lightPrimary,
      Color.lerp(
        darkPrimary,
        other.darkPrimary,
        t,
      ) ??
          darkPrimary,
      Color.lerp(
        lightSecondary,
        other.lightSecondary,
        t,
      ) ??
          lightSecondary,
      Color.lerp(
        darkSecondary,
        other.darkSecondary,
        t,
      ) ??
          darkSecondary,
    );
  }
}

/// Theme extension for providing various icon colors independent of the the current [Brightness] e.g.
/// Default icon colors, [AppBar] leading button & action buttons icons.
class IconColors extends ThemeExtension<IconColors> {
  final Color light;
  final Color dark;
  final Color appBarLight;
  final Color appBarDark;
  final Color appBarActionLight;
  final Color appBarActionDark;
  final Color lightDisabled;
  final Color darkDisabled;

  const IconColors(
      this.light,
      this.dark,
      this.appBarLight,
      this.appBarDark,
      this.appBarActionLight,
      this.appBarActionDark,
      this.lightDisabled,
      this.darkDisabled,
      );

  @override
  ThemeExtension<IconColors> copyWith({
    Color? light,
    Color? dark,
    Color? appBarLight,
    Color? appBarDark,
    Color? appBarActionLight,
    Color? appBarActionDark,
    Color? lightDisabled,
    Color? darkDisabled,
  }) {
    return IconColors(
      light ?? this.light,
      dark ?? this.dark,
      appBarLight ?? this.appBarLight,
      appBarDark ?? this.appBarDark,
      appBarActionLight ?? this.appBarActionLight,
      appBarActionDark ?? this.appBarActionDark,
      lightDisabled ?? this.lightDisabled,
      darkDisabled ?? this.darkDisabled,
    );
  }

  @override
  ThemeExtension<IconColors> lerp(ThemeExtension<IconColors>? other, double t) {
    if (other is! IconColors) {
      return this;
    }
    return IconColors(
      Color.lerp(
        light,
        other.light,
        t,
      ) ??
          light,
      Color.lerp(
        dark,
        other.dark,
        t,
      ) ??
          dark,
      Color.lerp(
        appBarLight,
        other.appBarLight,
        t,
      ) ??
          appBarLight,
      Color.lerp(
        appBarDark,
        other.appBarDark,
        t,
      ) ??
          appBarDark,
      Color.lerp(
        appBarActionLight,
        other.appBarActionLight,
        t,
      ) ??
          appBarActionLight,
      Color.lerp(
        appBarActionDark,
        other.appBarActionDark,
        t,
      ) ??
          appBarActionDark,
      Color.lerp(
        lightDisabled,
        other.lightDisabled,
        t,
      ) ??
          lightDisabled,
      Color.lerp(
        darkDisabled,
        other.darkDisabled,
        t,
      ) ??
          darkDisabled,
    );
  }
}


