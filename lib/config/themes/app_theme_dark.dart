import 'package:aqari/core/utils/app_strings.dart';
import 'package:aqari/core/utils/app_values.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// A class that defines a dark theme for the application.
class AppThemeDark {
  /// Returns a [ThemeData] object representing the dark theme of the app.
  ///
  /// The `lang` argument specifies the language for which the font family
  /// should be selected.
  ///
  /// The returned theme has its various properties configured, such as
  /// text styles, colors, etc.
  static ThemeData theme(String lang) {
    return ThemeData(
      // Define the primary color swatch.
      primarySwatch: ThemeHelper.appColors.primarySwatchColor,

      // Select the font family based on the language setting.
      fontFamily: lang == AppStrings.arabicCode
          ? AppStrings.arabicFontFamily
          : AppStrings.englishFontFamily,

      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: Color(0XFF007AFF),
      ),

      // Various color configurations.
      primaryColor: ThemeHelper.appColors.primarySwatchColor,
      dividerColor: ThemeHelper.appColors.white,
      highlightColor: ThemeHelper.appColors.lightGrey,
      hintColor: ThemeHelper.appColors.hintColor,
      disabledColor: ThemeHelper.appColors.disabledPrimary,

      // Set the brightness level.
      brightness: Brightness.light,

      // Additional color configurations.
      splashColor: ThemeHelper.appColors.secondaryColor,
      hoverColor: ThemeHelper.appColors.secondaryColor,
      cardColor: ThemeHelper.appColors.grey,
      shadowColor: ThemeHelper.appColors.secondaryColor,
      scaffoldBackgroundColor: ThemeHelper.appColors.white,
      colorScheme: ColorScheme.light(
        error: ThemeHelper.appColors.errorColor,
        surfaceTint: ThemeHelper.appColors.secondaryColor,
        onSurface: ThemeHelper.appColors.secondaryColor,
        primary: const Color(0XFF007AFF),
      ),

      // Configure the AppBar theme.
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: ThemeHelper.appColors.lightGrey,
        ),
        centerTitle: true,
        color: ThemeHelper.appColors.black,
      ),

      // Define text styles for different use-cases.
      textTheme: TextTheme(
        /// Used for main headers.
        displayLarge: TextStyle(
          fontSize: 53.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: AppValues.displayLargeLetterSpacing.sp,
        ),

        /// Used for sub-headers.
        displayMedium: TextStyle(
          fontSize: 33.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: AppValues.displayMediumLetterSpacing.sp,
        ),

        /// Used for smaller headers.
        displaySmall: TextStyle(
          fontSize: 29.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: AppValues.displaySmallLetterSpacing.sp,
        ),

        /// Used for prominent titles.
        titleLarge: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: AppValues.titleLargeLetterSpacing.sp,
        ),

        /// Used for subtitles and secondary titles.
        titleMedium: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: AppValues.titleMediumLetterSpacing.sp,
        ),

        /// Used for less prominent titles.
        titleSmall: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Used for very large headlines, often at the top of the screen.
        headlineLarge: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: AppValues.headlineLargeLetterSpacing.sp,
        ),

        /// Used for secondary body text.
        headlineMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Used for tertiary body text.
        headlineSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: AppValues.baseLetterSpacing.sp,
        ),

        /// Used for main body text.
        bodyLarge: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Used for standard body text.
        bodyMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Used for smaller body text or footnotes.
        bodySmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Used for labels on upgrader components.
        labelLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Used for scrolling text effects like marquee.
        labelMedium: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
        ),

        labelSmall: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: AppValues.labelSmallLetterSpacing.sp,
        ),
      ),
    );
  }
}
