import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/identity_verification/controllers/stepper_cubit/stepper_cubit.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// Identity Verification Screen
class IdentityVerificationScreen extends StatelessWidget {
  /// Constructor
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StepperCubit(),
      child: BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(titleText: S.of(context).idVerification),
            body: Column(
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
                    finishedStepBackgroundColor: Theme.of(context).primaryColor,
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
                Expanded(
                  child: BlocBuilder<StepperCubit, StepperState>(
                    builder: (context, state) {
                      switch (state) {
                        case StepperState.sellerDetails:
                          return const Center(
                            child: Text('Seller Details Step'),
                          );
                        case StepperState.identityVerification:
                          return const Center(
                            child: Text('Identity Verification Step'),
                          );
                        case StepperState.reviewAndVerification:
                          return const Center(
                            child: Text('Review & Verification Step'),
                          );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<StepperCubit>().nextStep();
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
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
