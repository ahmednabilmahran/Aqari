import 'package:flutter/material.dart';

/// A utility class for centralized management of app colors.
///
/// Contains color definitions that can be used throughout the application.
class AppColors {
  /// Primary color swatch for the application.
  MaterialColor primarySwatchColor = const MaterialColor(
    0XFF083D56,
    <int, Color>{
      50: Color(0XFF083D56),
      100: Color(0XFF083D56),
      200: Color(0XFF083D56),
      300: Color(0XFF083D56),
      400: Color(0XFF083D56),
      500: Color(0XFF083D56),
      600: Color(0XFF083D56),
      700: Color(0XFF083D56),
      800: Color(0XFF083D56),
      900: Color(0XFF083D56),
    },
  );

  /// The 'primaryColor' color.
  Color disabledPrimary = const Color(0XFF083D56).withOpacity(0.4);

  /// The 'secondaryColor' color.
  Color secondaryColor = const Color(0XFF04B8B1);

  /// The 'oliveColor' color.
  Color oliveColor = const Color(0XFF02AEA7);

  /// The 'mysticRiverGray' color.
  Color mysticRiverGray = const Color(0XFF576E80);

  /// The 'primaryBlue' color.
  Color primaryBlue = const Color(0XFFE6F6FD);

  /// The 'lightBordersBlue' color.
  Color lightBordersBlue = const Color(0XFFBCD2E0);

  /// focusing color.
  Color focusingColor = const Color(0XFF10C0E7);

  /// title text color.
  Color titleTextColor = const Color(0xFF233B43);

  /// body text color.
  Color bodyTextColor = const Color(0xFF2D404E);

  /// field text color.
  Color fieldBackgroundColor = const Color(0xFFFDFEFF);

  /// error color.
  Color errorColor = const Color(0xFFF81B1B);

  /// Grey color.
  Color grey = const Color(0xFFD9D9D9);

  /// White color.
  Color white = const Color(0xFFFFFFFF);

  /// The 'black' color.
  Color black = const Color(0xFF000000);

  /// The 'light grey' color.
  Color lightGrey = const Color(0xFF7E98A9);

  /// The 'baby blue' color.
  Color babyBlue = const Color(0xFFD7F3FE);

  /// The 'hint' color.
  Color hintColor = const Color(0xFF8593AD);

  /// The 'semi black' color.
  Color semiBlack = const Color(0xFF4D6066);

  /// Green color.
  Color green = const Color(0xFF27AE60);

  /// A second shade of grey.
  Color grey2 = const Color(0xFF635F5F);

  /// Dark grey color.
  Color darkGrey = const Color(0xFF5A5F61);

}
