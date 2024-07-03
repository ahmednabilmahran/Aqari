// ignore_for_file: lines_longer_than_80_chars

import 'package:aqari/apis/login_api.dart';
import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/loading.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_phone_number_text_field.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/login/controllers/login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

/// LoginScreen
class LoginScreen extends StatelessWidget {
  /// constructor
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dialogContext = context;
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt<LoginApi>(),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pop(dialogContext);
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.appLayoutRoute,
              (route) => false,
            );
          }
          if (state is LoginErrorState) {
            Navigator.pop(dialogContext);
            SnackX.showSnackBar(message: state.message, context: context);
          }
          if (state is LoginLoadingState) {
            loading(dialogContext);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
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
                    child: Form(
                      key: context.read<LoginCubit>().loginFormKey,
                      child: AutofillGroup(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.sp,
                                    color: ThemeHelper.appColors.black,
                                  ),
                            ),
                            SizedX.h2p5,
                            CustomPhoneNumberTextField(
                              controller:
                                  context.read<LoginCubit>().phoneController,
                              label: S.of(context).phoneNumber,
                              onChanged: (value) {
                                context.read<LoginCubit>().selectedCountry =
                                    value;
                              },
                              initialCountry:
                                  context.read<LoginCubit>().selectedCountry,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context.read<LoginCubit>().phoneNumberIsEmpty();
                                  return S.of(context).phoneNumberCantBeEmpty;
                                }
                                if (value.length >
                                        context
                                            .read<LoginCubit>()
                                            .selectedCountry
                                            .maxPhoneLength ||
                                    value.length <
                                        context
                                            .read<LoginCubit>()
                                            .selectedCountry
                                            .minPhoneLength) {
                                  context
                                      .read<LoginCubit>()
                                      .phoneNumberIsInvalid();
                                  return S
                                      .of(context)
                                      .pleaseEnterAValidPhoneNumber;
                                }
                                return null;
                              },
                            ),
                            AnimatedSize(
                              duration: const Duration(milliseconds: 1200),
                              curve: Curves.elasticInOut,
                              child: context
                                      .read<LoginCubit>()
                                      .isPasswordFieldVisible
                                  ? Column(
                                      children: [
                                        SizedX.h1p5,
                                        CustomTextField(
                                          controller: context
                                              .read<LoginCubit>()
                                              .passwordController,
                                          label: S.of(context).password,
                                          hintText:
                                              S.of(context).enterYourPassword,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: context
                                              .read<LoginCubit>()
                                              .isPasswordVisible,
                                          autofillHints: const [
                                            AutofillHints.password,
                                          ],
                                          suffixWidget: InkWell(
                                            focusColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            onTap: context
                                                .read<LoginCubit>()
                                                .toggleIsPasswordVisible,
                                            child: Transform.scale(
                                              scale: SizerUtil.deviceType ==
                                                      DeviceType.tablet
                                                  ? 0.7.sp
                                                  : 1,
                                              child: SvgPicture.asset(
                                                !context
                                                        .read<LoginCubit>()
                                                        .isPasswordVisible
                                                    ? Assets
                                                        .genIconsUnshowPasswordIcon
                                                    : Assets
                                                        .genIconsShowPasswordIcon,
                                                colorFilter: ColorFilter.mode(
                                                  Theme.of(context).hintColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              context
                                                  .read<LoginCubit>()
                                                  .passwordIsEmpty();
                                              return S
                                                  .of(context)
                                                  .passwordCantBeEmpty;
                                            }
              
                                            return null;
                                          },
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
                                                  color:
                                                      ThemeHelper.appColors.black,
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
                                onPressed: context
                                        .read<LoginCubit>()
                                        .isPasswordFieldVisible
                                    ? () {
                                        context.read<LoginCubit>().login();
                                      }
                                    : () {
                                        context
                                            .read<LoginCubit>()
                                            .toggleIsPasswordFieldVisible();
                                      },
                                fillBackgroundColor:
                                    ThemeHelper.appColors.secondaryColor,
                              ),
                            ),
                            SizedX.h2p5,
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: S.of(context).dontHaveAnAccount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              ThemeHelper.appColors.primaryColor,
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
