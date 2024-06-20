// ignore_for_file: lines_longer_than_80_chars

import 'package:aqari/apis/sign_up_api.dart';
import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/extensions.dart';
import 'package:aqari/core/utils/loading.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_phone_number_text_field.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/sign_up/controllers/sign_up/sign_up_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// SignUpScreen
class SignUpScreen extends StatelessWidget {
  /// constructor
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dialogContext = context;

    return BlocProvider(
      create: (context) => SignUpCubit(
        signUpApi: getIt<SignUpApi>(),
      ),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Navigator.pop(dialogContext);
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.verifySignUpRoute,
              (route) => false,
              arguments:
                  context.read<SignUpCubit>().emailController.text.isNotEmpty,
            );
          }
          if (state is SignUpErrorState) {
            Navigator.pop(dialogContext);
            SnackX.showSnackBar(message: state.message, context: context);
          }

          if (state is SignUpLoadingState) {
            loading(context);
          }
        },
        builder: (context, state) {
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
                    child: Form(
                      key: context.read<SignUpCubit>().signUpFormKey,
                      child: AutofillGroup(
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
                                    controller: context
                                        .read<SignUpCubit>()
                                        .firstNameController,
                                    label: S.of(context).firstName,
                                    hintText: S.of(context).enterYourFirstName,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).hintColor,
                                          letterSpacing: 0,
                                        ),
                                    keyboardType: TextInputType.name,
                                    autofillHints: const [AutofillHints.name],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        context
                                            .read<SignUpCubit>()
                                            .firstNameIsEmpty();
                                        return S
                                            .of(context)
                                            .firstNameCantBeEmpty;
                                      }
                                      final isName = value.isValidName;
                                      if (!isName) {
                                        context
                                            .read<SignUpCubit>()
                                            .firstNameIsInvalid();
                                        return S
                                            .of(context)
                                            .pleaseEnterValidName;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedX.w6,
                                Expanded(
                                  child: CustomTextField(
                                    controller: context
                                        .read<SignUpCubit>()
                                        .lastNameController,
                                    label: S.of(context).lastName,
                                    hintText: S.of(context).enterYourLastName,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).hintColor,
                                          letterSpacing: 0,
                                        ),
                                    keyboardType: TextInputType.name,
                                    autofillHints: const [AutofillHints.name],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        context
                                            .read<SignUpCubit>()
                                            .lastNameIsEmpty();
                                        return S
                                            .of(context)
                                            .lastNameCantBeEmpty;
                                      }
                                      final isName = value.isValidName;
                                      if (!isName) {
                                        context
                                            .read<SignUpCubit>()
                                            .lastNameIsInvalid();
                                        return S
                                            .of(context)
                                            .pleaseEnterValidName;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedX.h3,
                            CustomPhoneNumberTextField(
                              controller: context
                                  .read<SignUpCubit>()
                                  .phoneNumberController,
                              label: S.of(context).phoneNumber,
                              onChanged: (value) {
                                context.read<SignUpCubit>().selectedCountry =
                                    value;
                              },
                              initialCountry:
                                  context.read<SignUpCubit>().selectedCountry,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context
                                      .read<SignUpCubit>()
                                      .phoneNumberIsEmpty();
                                  return S.of(context).phoneNumberCantBeEmpty;
                                }
                                if (value.length >
                                        context
                                            .read<SignUpCubit>()
                                            .selectedCountry
                                            .maxPhoneLength ||
                                    value.length <
                                        context
                                            .read<SignUpCubit>()
                                            .selectedCountry
                                            .minPhoneLength) {
                                  context
                                      .read<SignUpCubit>()
                                      .phoneNumberIsInvalid();
                                  return S
                                      .of(context)
                                      .pleaseEnterAValidPhoneNumber;
                                }
                                return null;
                              },
                            ),
                            SizedX.h3,
                            CustomTextField(
                              controller:
                                  context.read<SignUpCubit>().emailController,
                              label:
                                  '${S.of(context).emailAddress} (${S.of(context).optional})',
                              hintText: S.of(context).enterYourEmail,
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [AutofillHints.email],
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  final isEmail = value.trim().isValidEmail;
                                  if (!isEmail) {
                                    context
                                        .read<SignUpCubit>()
                                        .emailIsInvalid();
                                    return S.of(context).pleaseEnterValidEmail;
                                  }
                                }
                                return null;
                              },
                            ),
                            SizedX.h3,
                            CustomTextField(
                              controller: context
                                  .read<SignUpCubit>()
                                  .passwordController,
                              focusNode:
                                  context.read<SignUpCubit>().passwordFocusNode,
                              label: S.of(context).password,
                              hintText: S.of(context).enterYourPassword,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  context.read<SignUpCubit>().isPasswordVisible,
                              autofillHints: const [AutofillHints.password],
                              suffixWidget: InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: context
                                    .read<SignUpCubit>()
                                    .toggleIsPasswordVisible,
                                child: Transform.scale(
                                  scale:
                                      SizerUtil.deviceType == DeviceType.tablet
                                          ? 0.7.sp
                                          : 1,
                                  child: SvgPicture.asset(
                                    !context
                                            .read<SignUpCubit>()
                                            .isPasswordVisible
                                        ? Assets.genIconsUnshowPasswordIcon
                                        : Assets.genIconsShowPasswordIcon,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context).hintColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context.read<SignUpCubit>().passwordIsEmpty();
                                  return S.of(context).passwordCantBeEmpty;
                                }
                                if (!value.isValidPassword) {
                                  context
                                      .read<SignUpCubit>()
                                      .passwordIsInvalid();
                                  return S.of(context).pleaseEnterValidPassword;
                                }
                                return null;
                              },
                              onChanged: (value) {
                                context
                                    .read<SignUpCubit>()
                                    .checkOnPassword(value);
                                return null;
                              },
                            ),
                            if (!context
                                .read<SignUpCubit>()
                                .isPasswordFocusedFirstTime)
                              Column(
                                children: [
                                  SizedX.h1,
                                  Row(
                                    children: [
                                      Transform.scale(
                                        scale: SizerUtil.deviceType ==
                                                DeviceType.tablet
                                            ? 0.7.sp
                                            : 1,
                                        child: SvgPicture.asset(
                                          ThemeHelper.isDarkTheme(context)
                                              ? !context
                                                      .read<SignUpCubit>()
                                                      .hasMinLength
                                                  ? Assets
                                                      .genIconsDarkUnvalidatedTextIcon
                                                  : Assets
                                                      .genIconsDarkValidatedTextIcon
                                              : !context
                                                      .read<SignUpCubit>()
                                                      .hasMinLength
                                                  ? Assets
                                                      .genIconsUnvalidatedTextIcon
                                                  : Assets
                                                      .genIconsValidatedTextIcon,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.transparent,
                                            BlendMode.difference,
                                          ),
                                        ),
                                      ),
                                      SizedX.w2,
                                      Expanded(
                                        child: Text(
                                          S
                                              .of(context)
                                              .passwordContainsAtLeast8Characters,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color:
                                                    Theme.of(context).hintColor,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedX.h1,
                                  Row(
                                    children: [
                                      Transform.scale(
                                        scale: SizerUtil.deviceType ==
                                                DeviceType.tablet
                                            ? 0.7.sp
                                            : 1,
                                        child: SvgPicture.asset(
                                          ThemeHelper.isDarkTheme(context)
                                              ? !context
                                                      .read<SignUpCubit>()
                                                      .hasNumber
                                                  ? Assets
                                                      .genIconsDarkUnvalidatedTextIcon
                                                  : Assets
                                                      .genIconsDarkValidatedTextIcon
                                              : !context
                                                      .read<SignUpCubit>()
                                                      .hasNumber
                                                  ? Assets
                                                      .genIconsUnvalidatedTextIcon
                                                  : Assets
                                                      .genIconsValidatedTextIcon,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.transparent,
                                            BlendMode.difference,
                                          ),
                                        ),
                                      ),
                                      SizedX.w2,
                                      Expanded(
                                        child: Text(
                                          S
                                              .of(context)
                                              .passwordContainsAtLeast1Number,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color:
                                                    Theme.of(context).hintColor,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedX.h1,
                                  Row(
                                    children: [
                                      Transform.scale(
                                        scale: SizerUtil.deviceType ==
                                                DeviceType.tablet
                                            ? 0.7.sp
                                            : 1,
                                        child: SvgPicture.asset(
                                          ThemeHelper.isDarkTheme(context)
                                              ? !context
                                                      .read<SignUpCubit>()
                                                      .hasSpecialChar
                                                  ? Assets
                                                      .genIconsDarkUnvalidatedTextIcon
                                                  : Assets
                                                      .genIconsDarkValidatedTextIcon
                                              : !context
                                                      .read<SignUpCubit>()
                                                      .hasSpecialChar
                                                  ? Assets
                                                      .genIconsUnvalidatedTextIcon
                                                  : Assets
                                                      .genIconsValidatedTextIcon,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.transparent,
                                            BlendMode.difference,
                                          ),
                                        ),
                                      ),
                                      SizedX.w2,
                                      Expanded(
                                        child: Text(
                                          S
                                              .of(context)
                                              .passwordContainsAtLeast1SpecialCharacter,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color:
                                                    Theme.of(context).hintColor,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedX.h1,
                                  Row(
                                    children: [
                                      Transform.scale(
                                        scale: SizerUtil.deviceType ==
                                                DeviceType.tablet
                                            ? 0.7.sp
                                            : 1,
                                        child: SvgPicture.asset(
                                          ThemeHelper.isDarkTheme(context)
                                              ? !context
                                                      .read<SignUpCubit>()
                                                      .passwordsIsEqualed
                                                  ? Assets
                                                      .genIconsDarkUnvalidatedTextIcon
                                                  : Assets
                                                      .genIconsDarkValidatedTextIcon
                                              : !context
                                                      .read<SignUpCubit>()
                                                      .passwordsIsEqualed
                                                  ? Assets
                                                      .genIconsUnvalidatedTextIcon
                                                  : Assets
                                                      .genIconsValidatedTextIcon,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.transparent,
                                            BlendMode.difference,
                                          ),
                                        ),
                                      ),
                                      SizedX.w2,
                                      Expanded(
                                        child: Text(
                                          S.of(context).passwordsAreMatched,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color:
                                                    Theme.of(context).hintColor,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            else
                              const SizedBox(),
                            SizedX.h3,
                            CustomTextField(
                              controller: context
                                  .read<SignUpCubit>()
                                  .verificationController,
                              label: S.of(context).confirmPassword,
                              hintText: S.of(context).confirmYourPassword,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  context.read<SignUpCubit>().isPasswordVisible,
                              autofillHints: const [AutofillHints.password],
                              suffixWidget: InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: context
                                    .read<SignUpCubit>()
                                    .toggleIsPasswordVisible,
                                child: Transform.scale(
                                  scale:
                                      SizerUtil.deviceType == DeviceType.tablet
                                          ? 0.7.sp
                                          : 1,
                                  child: SvgPicture.asset(
                                    !context
                                            .read<SignUpCubit>()
                                            .isPasswordVisible
                                        ? Assets.genIconsUnshowPasswordIcon
                                        : Assets.genIconsShowPasswordIcon,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context).dividerColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context.read<SignUpCubit>().passwordIsEmpty();
                                  return S.of(context).passwordCantBeEmpty;
                                }
                                if (!value.isValidPassword) {
                                  context
                                      .read<SignUpCubit>()
                                      .passwordIsInvalid();
                                  return S.of(context).pleaseEnterValidPassword;
                                }
                                return null;
                              },
                              onChanged: (value) {
                                context
                                    .read<SignUpCubit>()
                                    .checkOnVerificationPassword(value);
                                return null;
                              },
                            ),
                            SizedX.h3,
                            Hero(
                              tag: 'button',
                              child: CustomButton(
                                onPressed: () async {
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   Routes.appLayoutRoute,
                                  // );

                                  await context
                                      .read<SignUpCubit>()
                                      .signUpWithPhone();
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
                                    text: S.of(context).login,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeHelper
                                              .appColors.primaryColor,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
