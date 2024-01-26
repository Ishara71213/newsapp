import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/config/theme/theme_const.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: LightTheme.kPrimaryColor,
    dividerColor: LightTheme.kAppBgMediumShade,
    //color scheme
    colorScheme: ColorScheme.light(
      background: LightTheme.kAppBgColor,
      primary: LightTheme.kPrimaryColor,
      onBackground: LightTheme.kDarkGreyShade,
      secondary: LightTheme.kPrimaryMediumShade,
      primaryContainer: LightTheme.kPrimaryColor,
      tertiary: LightTheme.kDarkGreyShade,
      onPrimaryContainer: LightTheme.kWhiteColor,
      error: LightTheme.kWarnningColor,
      errorContainer: LightTheme.kWarnningColor,
      onErrorContainer: LightTheme.kWhiteColor,
      onTertiaryContainer: LightTheme.kGreyColor,
      tertiaryContainer: LightTheme.kAppBgDarkShade,
      surface: LightTheme.kAppBgLighterShade,
      surfaceVariant: LightTheme.kAppBgLightestShade,
    ),
    //Filled Button Styles
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
      textStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: LightTheme.kAppBgColor,
      ),
      minimumSize: const Size.fromHeight(60),
      backgroundColor: LightTheme.kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    )),
    //Input Decorations
    inputDecorationTheme: InputDecorationTheme(
        fillColor: LightTheme.inputBoxTextColor,
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: LightTheme.kGreyColor,
        ),
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: LightTheme.kGreyMediumShade,
        ),
        prefixStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: LightTheme.kDarkGreyShade,
            letterSpacing: 0.2),
        suffixStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: LightTheme.kDarkGreyShade,
            letterSpacing: 0.2),
        counterStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: LightTheme.kDarkGreyShade,
            letterSpacing: 0.2),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: LightTheme.kAppBgMediumShade)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: LightTheme.kErrorColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: LightTheme.kErrorColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                width: 1.4,
                style: BorderStyle.solid,
                color: LightTheme.kAppBgMediumShade))),

    //text Theme Styles
    textTheme: TextTheme(
      //App bar title and other titles
      titleLarge: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: LightTheme.kDarkGreyShade,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: LightTheme.kDarkGreyShade,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: LightTheme.kDarkGreyShade,
      ),
      //News card title
      displayLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: LightTheme.kAppBgLightestShade,
        letterSpacing: 0.1,
        height: 1.24,
      ),
      //Button text style
      displayMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: LightTheme.kAppBgColor,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: LightTheme.kPrimaryColor,
      ),
      //Input Field Text style
      bodyLarge: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: LightTheme.kDarkGreyShade,
          letterSpacing: 0.2),
      //body Text
      bodyMedium: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: LightTheme.kDarkGreyShade,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: LightTheme.kDarkGreyShade,
      ),
      //tag lines
      labelSmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: LightTheme.kGreyColor,
      ),
    ),
  ),
  AppTheme.dark: ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: DarkTheme.kPrimaryColor,
    dividerColor: DarkTheme.kAppBgMediumShade,
    //color scheme
    colorScheme: ColorScheme.dark(
      background: DarkTheme.kAppBgColor,
      primary: DarkTheme.kPrimaryColor,
      secondary: DarkTheme.kPrimaryMediumShade,
      primaryContainer: DarkTheme.kPrimaryColor,
      onPrimaryContainer: DarkTheme.kWhiteColor,
      error: DarkTheme.kWarnningColor,
      errorContainer: DarkTheme.kWarnningColor,
      onErrorContainer: DarkTheme.kWhiteColor,
      onTertiaryContainer: DarkTheme.kGreyColor,
      tertiaryContainer: DarkTheme.kAppBgDarkShade,
    ),
    //Filled Button Styles
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
      textStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: DarkTheme.kAppBgColor,
      ),
      minimumSize: const Size.fromHeight(60),
      backgroundColor: DarkTheme.kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    )),
    //Input Decorations
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: DarkTheme.kDarkGreyShade,
      ),
      labelStyle: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: DarkTheme.kGreyMediumShade,
      ),
      prefixStyle: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: DarkTheme.kDarkGreyShade,
          letterSpacing: 0.2),
      suffixStyle: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: DarkTheme.kDarkGreyShade,
          letterSpacing: 0.2),
      counterStyle: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: DarkTheme.kDarkGreyShade,
          letterSpacing: 0.2),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: DarkTheme.kDarkGreyShade,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: DarkTheme.kDarkGreyShade,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: DarkTheme.kDarkGreyShade,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: DarkTheme.kPrimaryColor,
      ),
      //Button text style
      displayMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: LightTheme.kAppBgColor,
      ),
      //body Text
      bodyMedium: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: DarkTheme.kDarkGreyShade,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: DarkTheme.kDarkGreyShade,
      ),
    ),
  ),
};
