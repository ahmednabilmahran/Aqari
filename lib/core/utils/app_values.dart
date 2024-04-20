import 'dart:io';

import 'package:sizer/sizer.dart';

/// This class is the app static values
class AppValues {
  /// The app bar height
  static double appBarHeight = 6.h;

  /// base letter spacing
  static double baseLetterSpacing = Platform.isIOS ? -0.05 : 0;

  /// display large letter spacing
  static double displayLargeLetterSpacing = Platform.isIOS ? -1.5 : 0;

  /// display medium letter spacing
  static double displayMediumLetterSpacing = Platform.isIOS ? 0.2 : 0;

  /// display small letter spacing
  static double displaySmallLetterSpacing = Platform.isIOS ? -1.75 : 0;

  /// title large letter spacing
  static double titleLargeLetterSpacing = Platform.isIOS ? -1.25 : 0;

  /// title medium letter spacing
  static double titleMediumLetterSpacing = Platform.isIOS ? -0.5 : 0;

  /// headline large letter spacing
  static double headlineLargeLetterSpacing = Platform.isIOS ? -1.5 : 0;

  /// headline small letter spacing
  static double headlineSmallLetterSpacing = Platform.isIOS ? 2.5 : 0;

  /// label small letter spacing
  static double labelSmallLetterSpacing = Platform.isIOS ? -0.25 : 0;
}
