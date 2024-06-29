import 'package:flutter_bloc/flutter_bloc.dart';

part 'stepper_state.dart';

/// [StepperCubit]
class StepperCubit extends Cubit<StepperState> {
  /// [StepperCubit] constructor
  StepperCubit() : super(StepperState.identityVerification);

  /// [nextStep]
  void nextStep() {
    switch (state) {
      case StepperState.sellerDetails:
        emit(StepperState.identityVerification);
      case StepperState.identityVerification:
        emit(StepperState.reviewAndVerification);
      case StepperState.reviewAndVerification:
        // No next step
        break;
    }
  }
}
