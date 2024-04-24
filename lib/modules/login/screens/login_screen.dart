import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_phone_number_text_field.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

/// LoginScreen
class LoginScreen extends StatefulWidget {
  /// constructor
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool _isPasswordFieldVisible = false;

  void _onLoginPressed() {
    setState(() {
      _isPasswordFieldVisible = !_isPasswordFieldVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.genImagesLoginBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: CustomPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: SvgPicture.asset(
                    Assets.genIconsLogoText,
                    height: 7.5.h,
                    width: 7.5.w,
                  ),
                ),
                SizedX.h2,
                Text(
                  S.of(context).loginToAccessYourAccount,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp,
                        color: ThemeHelper.appColors.black,
                      ),
                ),
                SizedX.h2p5,
                CustomPhoneNumberTextField(
                  controller: phone,
                  label: S.of(context).phoneNumber,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.elasticInOut,
                  child: _isPasswordFieldVisible
                      ? Column(
                          children: [
                            SizedX.h1p5,
                            CustomTextField(
                              controller: password,
                              label: S.of(context).password,
                              obscureText: true,
                              hintText: S.of(context).enterYourPassword,
                            ),
                            SizedX.h1,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                S.of(context).forgotPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: ThemeHelper.appColors.black,
                                    ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
                SizedX.h2,
                Hero(
                  tag: 'button',
                  child: CustomButton(
                    buttonText: S.of(context).login,
                    onPressed: _onLoginPressed,
                    fillBackgroundColor: ThemeHelper.appColors.secondaryColor,
                  ),
                ),
                SizedX.h2p5,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).dontHaveAnAccount,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: ThemeHelper.appColors.black,
                            ),
                      ),
                      const TextSpan(
                        text: '  ',
                      ),
                      TextSpan(
                        text: S.of(context).joinNow,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: ThemeHelper.appColors.primaryColor,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.signUpRoute,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
