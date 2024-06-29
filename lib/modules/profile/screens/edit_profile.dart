import 'package:aqari/apis/sign_up_api.dart';
import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/utils/extensions.dart';
import 'package:aqari/core/utils/loading.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_phone_number_text_field.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/profile/controllers/edite_profile/edit_profile_cubit.dart';
import 'package:aqari/modules/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// EditProfile is used to manage the edit profile screen
class EditProfile extends StatelessWidget {
  /// EditProfile is used to manage the edit profile screen
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final dialogContext = context;

    return BlocProvider(
      create: (context) => EditProfileCubit(
        signUpApi: getIt<SignUpApi>(),
      ),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Navigator.pop(dialogContext);
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.verifySignUpRoute,
              (route) => false,
              arguments: context
                  .read<EditProfileCubit>()
                  .emailController
                  .text
                  .isNotEmpty,
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
            backgroundColor: Colors.white70,
            appBar: const CustomAppBar(
              titleText: 'Edit Profile',
            ),
            body: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: CustomPadding(
                    child: Form(
                      key: context.read<EditProfileCubit>().signUpFormKey,
                      child: AutofillGroup(
                        child: Column(
                          children: [
                            SizedX.h3,
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50.sp,
                                  backgroundImage: AssetImage(profile.image),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 15.sp,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedX.h3,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: context
                                        .read<EditProfileCubit>()
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
                                            .read<EditProfileCubit>()
                                            .firstNameIsEmpty();
                                        return S
                                            .of(context)
                                            .firstNameCantBeEmpty;
                                      }
                                      final isName = value.isValidName;
                                      if (!isName) {
                                        context
                                            .read<EditProfileCubit>()
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
                                        .read<EditProfileCubit>()
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
                                            .read<EditProfileCubit>()
                                            .lastNameIsEmpty();
                                        return S
                                            .of(context)
                                            .lastNameCantBeEmpty;
                                      }
                                      final isName = value.isValidName;
                                      if (!isName) {
                                        context
                                            .read<EditProfileCubit>()
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
                                  .read<EditProfileCubit>()
                                  .phoneNumberController,
                              label: S.of(context).phoneNumber,
                              onChanged: (value) {
                                context
                                    .read<EditProfileCubit>()
                                    .selectedCountry = value;
                              },
                              initialCountry: context
                                  .read<EditProfileCubit>()
                                  .selectedCountry,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context
                                      .read<EditProfileCubit>()
                                      .phoneNumberIsEmpty();
                                  return S.of(context).phoneNumberCantBeEmpty;
                                }
                                if (value.length >
                                        context
                                            .read<EditProfileCubit>()
                                            .selectedCountry
                                            .maxPhoneLength ||
                                    value.length <
                                        context
                                            .read<EditProfileCubit>()
                                            .selectedCountry
                                            .minPhoneLength) {
                                  context
                                      .read<EditProfileCubit>()
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
                              controller: context
                                  .read<EditProfileCubit>()
                                  .emailController,
                              label:
                                  // ignore: lines_longer_than_80_chars
                                  '${S.of(context).emailAddress} (${S.of(context).optional})',
                              hintText: S.of(context).enterYourEmail,
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [AutofillHints.email],
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  final isEmail = value.trim().isValidEmail;
                                  if (!isEmail) {
                                    context
                                        .read<EditProfileCubit>()
                                        .emailIsInvalid();
                                    return S.of(context).pleaseEnterValidEmail;
                                  }
                                }
                                return null;
                              },
                            ),
                            SizedX.h3,
                            SizedX.h4,
                            Hero(
                              tag: 'button',
                              child: CustomButton(
                                onPressed: () async {
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   Routes.appLayoutRoute,
                                  // );

                                  await context
                                      .read<EditProfileCubit>()
                                      .signUpWithPhone();
                                },
                                buttonText: 'Save',
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

/// CustomContainerProfile
class CustomContainerProfile extends StatelessWidget {
  /// constructor
  const CustomContainerProfile({
    required this.imageUrl,
    required this.text,
    super.key,
    this.onTap,
  });

  /// imageUrl
  final String imageUrl;

  /// onTap
  final VoidCallback Function()? onTap;

  /// text
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.language, color: Colors.lightBlueAccent),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis, // Ensure text doesn't overflow
              ),
            ),
          ],
        ),
      ),
    );
  }
}
