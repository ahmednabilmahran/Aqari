import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/identity_verification/controllers/imageUpload/image_upload_cubit.dart';
import 'package:aqari/modules/identity_verification/controllers/stepper_cubit/stepper_cubit.dart';
import 'package:aqari/modules/identity_verification/widgets/pick_image.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// Identity Verification Screen
class IdentityVerificationScreen extends StatefulWidget {
  /// Constructor
  const IdentityVerificationScreen({super.key});

  @override
  State<IdentityVerificationScreen> createState() =>
      _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState
    extends State<IdentityVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => StepperCubit(),
        ),
        BlocProvider(
          create: (context) => ImageUploadCubit(),
        ),
      ],
      child: BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(titleText: S.of(context).idVerification),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: EasyStepper(
                      activeStep: state.index,
                      stepRadius: 18.0,
                      showLoadingAnimation: false,
                      lineStyle: LineStyle(
                        lineType: LineType.normal,
                        activeLineColor: ThemeHelper.appColors.black,
                        defaultLineColor: ThemeHelper.appColors.black,
                        finishedLineColor: ThemeHelper.appColors.black,
                        unreachedLineColor: ThemeHelper.appColors.black,
                        lineLength: 20.w,
                        lineSpace: 0,
                      ),
                      activeStepBorderColor: Theme.of(context).primaryColor,
                      finishedStepBorderColor: Theme.of(context).primaryColor,
                      activeStepIconColor: Colors.white,
                      finishedStepTextColor: ThemeHelper.appColors.black,
                      showStepBorder: false,
                      finishedStepIconColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      activeStepTextColor: ThemeHelper.appColors.black,
                      unreachedStepTextColor: ThemeHelper.appColors.black,
                      finishedStepBackgroundColor:
                          Theme.of(context).primaryColor,
                      steps: [
                        EasyStep(
                          customStep: _buildCustomStep(
                            context,
                            isActive:
                                state.index == StepperState.sellerDetails.index,
                            isFinished:
                                state.index > StepperState.sellerDetails.index,
                            index: 1,
                          ),
                          title: 'Seller \ndetails',
                        ),
                        EasyStep(
                          customStep: _buildCustomStep(
                            context,
                            isActive: state.index ==
                                StepperState.identityVerification.index,
                            isFinished: state.index >
                                StepperState.identityVerification.index,
                            index: 2,
                          ),
                          title: 'Identity \nVerification',
                        ),
                        EasyStep(
                          customStep: _buildCustomStep(
                            context,
                            isActive: state.index ==
                                StepperState.reviewAndVerification.index,
                            isFinished: state.index >
                                StepperState.reviewAndVerification.index,
                            index: 3,
                          ),
                          title: 'Review & \nVerification',
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: BlocBuilder<StepperCubit, StepperState>(
                      builder: (context, state) {
                        switch (state) {
                          case StepperState.sellerDetails:
                            return const Center(
                              child: Text('Seller Details Step'),
                            );
                          case StepperState.identityVerification:
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 32,
                              ),
                              child: Column(
                                children: [
                                  const Center(
                                    child: Text(
                                      'Identity Verification ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                    child: Text(
                                      // ignore: lines_longer_than_80_chars
                                      'We need to verify your identity for authentic',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                    child: Text(
                                      'and secure listings.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    label: 'National ID',
                                    hintText: 'Enter your National ID',
                                    controller: controller,
                                  ),
                                  const SizedBox(height: 30),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('ID Photo'),
                                  ),
                                  BlocBuilder<ImageUploadCubit,
                                      ImageUploadState>(
                                    builder: (context, state) {
                                      return Column(
                                        children: [
                                          UploadContainer(
                                            cubitContext: context
                                                .read<ImageUploadCubit>(),
                                            image: state.imageID,
                                            type: 'ID',
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(height: 2.h),
                                  CustomButton(
                                    onPressed: () {
                                      if (controller.text.isEmpty  ) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Please enter your National ID'),
                                          ),
                                        );
                                      }
                                      else {
                                        context.read<StepperCubit>().nextStep();
                                      }

                                    },
                                    buttonText: 'Confirm',
                                  ),
                                ],
                              ),
                            );
                          case StepperState.reviewAndVerification:
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Review & Verification Step',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Image(
                                      image: AssetImage(
                                        Assets.genImagesThankIdVerfication,
                                      ),
                                    ),
                                    SizedBox(height: 25.h),
                                    CustomButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      buttonText: 'HomePage',
                                    ),
                                  ],
                                ),
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCustomStep(
    BuildContext context, {
    required bool isActive,
    required bool isFinished,
    required int index,
  }) {
    return CircleAvatar(
      backgroundColor: isFinished || isActive
          ? Theme.of(context).primaryColor
          : ThemeHelper.appColors.darkGrey,
      child: isFinished
          ? Icon(
              Icons.check,
              color: Colors.white,
              size: 20.sp,
            )
          : Text(
              '$index',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
            ),
    );
  }
}
