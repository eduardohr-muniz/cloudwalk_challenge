import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';

class ThemeCustom {
  ThemeCustom._();
  static final lightTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    scaffoldBackgroundColor: CwColors.light.surface,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: CwColors.light.primaryColor,
      selectionColor: CwColors.light.primaryColor.withOpacity(0.5),
      selectionHandleColor: CwColors.light.primaryColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: CwColors.light.primaryBG, surfaceTintColor: CwColors.light.primaryBG),
    dialogTheme: DialogTheme(
      backgroundColor: CwColors.light.primaryBG,
      surfaceTintColor: CwColors.light.primaryBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    brightness: Brightness.light,
    extensions: [CwColors.light],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: CwColors.light.surface, //primaryBackGround
      onBackground: CwColors.light.secondaryText,
      surface: CwColors.light.primaryBG, // secondary Backgorund
      onSurface: CwColors.light.primaryText,
      primary: CwColors.light.primaryColor,
      onPrimary: CwColors.light.primaryText,
      secondary: CwColors.light.primaryColor,
      onSecondary: CwColors.light.secondaryText,
      error: CwColors.light.errorColor,
      onError: CwColors.light.primaryBG,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    scaffoldBackgroundColor: CwColors.dark.surface,
    // textTheme: text,
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: CwColors.light.primaryColor,
      selectionColor: CwColors.light.primaryColor.withOpacity(0.5),
      selectionHandleColor: CwColors.light.primaryColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: CwColors.dark.primaryBG, surfaceTintColor: CwColors.dark.primaryBG),
    dialogTheme: DialogTheme(
      backgroundColor: CwColors.dark.primaryBG,
      surfaceTintColor: CwColors.dark.primaryBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    extensions: [CwColors.dark],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      background: CwColors.dark.surface, //primaryBackGround
      onBackground: CwColors.dark.secondaryText,
      surface: CwColors.dark.primaryBG, // secondary Backgorund
      onSurface: CwColors.dark.primaryText,
      primary: CwColors.dark.primaryColor,
      onPrimary: CwColors.dark.primaryText,
      secondary: CwColors.dark.primaryColor,
      onSecondary: CwColors.dark.secondaryText,
      error: CwColors.dark.errorColor,
      onError: CwColors.dark.primaryText,
    ),
  );

  static const text = TextTheme(
    displayLarge: TextStyle(letterSpacing: 0),
    displayMedium: TextStyle(letterSpacing: 0),
    displaySmall: TextStyle(letterSpacing: 0),
    //
    headlineLarge: TextStyle(letterSpacing: 0),
    headlineMedium: TextStyle(letterSpacing: 0),
    headlineSmall: TextStyle(letterSpacing: 0),
    //
    titleLarge: TextStyle(letterSpacing: 0),
    titleMedium: TextStyle(letterSpacing: 0),
    titleSmall: TextStyle(letterSpacing: 0),
    //
    labelLarge: TextStyle(letterSpacing: 0),
    labelMedium: TextStyle(letterSpacing: 0),
    labelSmall: TextStyle(letterSpacing: 0),
    //
    bodyLarge: TextStyle(letterSpacing: 0),
    bodyMedium: TextStyle(letterSpacing: 0),
    bodySmall: TextStyle(letterSpacing: 0),
  );
}
