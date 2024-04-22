import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_phone_number_text_field.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// SplashScreen
class SplashScreen extends StatefulWidget {
  /// constructor
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to LoginScreen
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    });
  }
  @override
  Widget build(BuildContext context)  {

    return Scaffold(
      backgroundColor: ThemeHelper.appColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(Assets.iconsLogoSplash)
      ),
    );
  }
}
