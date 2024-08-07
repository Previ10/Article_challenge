import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Palette.primary,
  scaffoldBackgroundColor: Palette.backgroundColorScaffold,
  colorScheme: ColorScheme.light(
    primary: Palette.primary,
    secondary: Palette.secondary,
    surface: Palette.backgroundColorScaffold,
    error: Palette.error,
  ),
  useMaterial3: true,
);

final darkTheme = ThemeData(
  primaryColor: Palette.primaryDark,
  scaffoldBackgroundColor: Palette.backgroundColorScaffoldDark,
  colorScheme: ColorScheme.dark(
    primary: Palette.primaryDark,
    secondary: Palette.secondaryDark,
    surface: Palette.surfaceDark,
    error: Palette.error,
  ),
  useMaterial3: true,
);

class Palette {
  static Color backgroundColorScaffold = const Color.fromRGBO(242, 244, 247, 1);
  static Color primary = const Color(0xff0B142F);
  static Color softGrey = Colors.grey.shade300;
  static Color mediumGrey = Colors.grey.shade700;
  static Color darkGrey = Colors.grey.shade800;
  static Color pinkButton = const Color.fromARGB(255, 187, 64, 198);
  static Color secondary = const Color(0xffEC663A);
  static Color primaryFocused = const Color(0xff042859);
  static Color blue = const Color(0xFF005AA7);
  static Color intenseGrey = const Color.fromARGB(255, 45, 45, 45);
  static Color lightBlue = const Color.fromARGB(255, 46, 133, 210);
  static Color error = const Color.fromARGB(255, 181, 29, 29);
  static Color secondarySoft = const Color.fromARGB(255, 216, 137, 111);

  static Color backgroundColorScaffoldDark =
      const Color.fromRGBO(18, 18, 18, 1);
  static Color backgroundColorDark = const Color.fromRGBO(0, 0, 0, 1);
  static Color primaryDark = const Color(0xff0A0E2F);
  static Color secondaryDark = const Color(0xffD4502C);
  static Color surfaceDark = const Color.fromRGBO(30, 30, 30, 1);
}
