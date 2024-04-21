import 'package:flutter/material.dart';

/// A utility class for centralized management of app colors.
///
/// Contains color definitions that can be used throughout the application.
class AppColors {
  /// Primary color swatch for the application.
  MaterialColor primarySwatchColor = const MaterialColor(
    0XFFB5854B,
    <int, Color>{
      50: Color(0XFFB5854B),
      100: Color(0XFFB5854B),
      200: Color(0XFFB5854B),
      300: Color(0XFFB5854B),
      400: Color(0XFFB5854B),
      500: Color(0XFFB5854B),
      600: Color(0XFFB5854B),
      700: Color(0XFFB5854B),
      800: Color(0XFFB5854B),
      900: Color(0XFFB5854B),
    },
  );

  /// The 'primaryColor' color.
  Color primaryColor = const Color(0XFFB5854B);

  /// The 'disabledPrimary' color.
  Color disabledPrimary = const Color(0XFFB5854B).withOpacity(0.4);

  /// The 'secondaryColor' color.
  Color secondaryColor = const Color(0XFF47515D);

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

  /// The 'hint' color.
  Color hintColor = const Color(0xFF000000).withOpacity(0.5);

  /// The 'semi black' color.
  Color semiBlack = const Color(0xFF4D6066);

  /// Dark grey color.
  Color darkGrey = const Color(0xFF5A5F61);

  /// The 'borderColor' color.
  Color borderColor = const Color(0XFFD0D5DD);
}
