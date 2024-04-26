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
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// SignUpScreen
class SignUpScreen extends StatelessWidget {
  /// constructor
  const SignUpScreen({super.key});

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
          child: SingleChildScrollView(
            child: CustomPadding(
              child: Column(
                children: [
                  SizedX.h4,
                  Hero(
                    tag: 'logo',
                    child: SvgPicture.asset(
                      Assets.genIconsLogoText,
                      height: 7.5.h,
                      width: 7.5.w,
                    ),
                  ),
                  SizedX.h3,
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: TextEditingController(),
                          label: S.of(context).firstName,
                          hintText: S.of(context).enterYourFirstName,
                          hintStyle:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).hintColor,
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                      SizedX.w6,
                      Expanded(
                        child: CustomTextField(
                          controller: TextEditingController(),
                          label: S.of(context).lastName,
                          hintText: S.of(context).enterYourLastName,
                          hintStyle:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).hintColor,
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  SizedX.h3,
                  CustomPhoneNumberTextField(
                    controller: TextEditingController(),
                    label: S.of(context).phoneNumber,
                  ),
                  SizedX.h3,
                  CustomTextField(
                    controller: TextEditingController(),
                    label:
                        // ignore: lines_longer_than_80_chars
                        '${S.of(context).emailAddress} (${S.of(context).optional})',
                    hintText: S.of(context).enterYourEmail,
                  ),
                  SizedX.h3,
                  CustomTextField(
                    controller: TextEditingController(),
                    label: S.of(context).password,
                    hintText: S.of(context).enterYourPassword,
                    obscureText: true,
                  ),
                  SizedX.h3,
                  CustomTextField(
                    controller: TextEditingController(),
                    label: S.of(context).confirmPassword,
                    hintText: S.of(context).confirmYourPassword,
                    obscureText: true,
                  ),
                  SizedX.h3,
                  Hero(
                    tag: 'button',
                    child: CustomButton(
                      onPressed: () {

                        Navigator.pushNamed(context, Routes.appLayoutRoute);
                      },
                      buttonText: S.of(context).signUp,
                    ),
                  ),
                  SizedX.h2p5,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: S.of(context).alreadyHaveAnAccount,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ThemeHelper.appColors.black,
                                  ),
                        ),
                        const TextSpan(
                          text: '  ',
                        ),
                        TextSpan(
                          text: S.of(context).login,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ThemeHelper.appColors.primaryColor,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.loginRoute,
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
      ),
    );
  }
}
