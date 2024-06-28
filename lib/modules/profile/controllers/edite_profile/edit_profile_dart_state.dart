part of 'edit_profile_dart_cubit.dart';

@immutable
abstract class EditProfileDartState {
  /// Constructor for the base [EditProfileDartState] class.
  const EditProfileDartState();
}


class EditProfileDartInitial extends EditProfileDartState {}

/// Initial state of the sign-up process.
///
/// This state is emitted when the sign-up process has not started yet or has been reset.
class EditProfileSignUpInitial extends EditProfileDartState {}

/// State representing the visibility change of the password input field.
///
/// This state is emitted when the visibility of the password input field is toggled.
class PasswordChangeVisibleState extends EditProfileDartState {}

/// State representing the loading state of the sign-up process.
///
/// This state is emitted when the sign-up process is underway, indicating that the
/// user should wait for the process to complete.
class SignUpLoadingState extends EditProfileDartState {}

/// State representing an error that occurred during the sign-up process.
///
/// This state is emitted when an error occurs during the sign-up process, providing
/// an error message to be displayed to the user.
class SignUpErrorState extends EditProfileDartState {
  /// Constructor for the [SignUpErrorState] class.
  ///
  /// Parameters:
  /// - [message]: The error message describing what went wrong during the sign-up process.
  const SignUpErrorState(this.message);

  /// The error message describing what went wrong during the sign-up process.
  final String message;
}

/// State representing the successful completion of the sign-up process.
///
/// This state is emitted when the user has been successfully signed up.
class SignUpSuccessState extends EditProfileDartState {}

/// State representing the first-time focus on the password input field.
///
/// This state is emitted when the password input field is focused for the first time.
class PasswordFieldIsFirstTimeFocused extends EditProfileDartState {}

/// State representing the result of the password compliance check.
///
/// This state is emitted when the password input is checked for compliance with password policies.
class SignUpPasswordChecked extends EditProfileDartState {}

/// for the first name input field.
class FirstNameIsEmpty extends EditProfileDartState {}

/// State representing an invalid first name input.
class FirstNameIsInvalid extends EditProfileDartState {}

/// State representing an empty last name input field.
class LastNameIsEmpty extends EditProfileDartState {}

/// State representing an invalid last name input.
class LastNameIsInvalid extends EditProfileDartState {}

/// State representing an empty email input field.
class EmailIsInvalid extends EditProfileDartState {}

/// State representing an invalid email input.
class PasswordIsInvalid extends EditProfileDartState {}

/// State representing an empty password input field.
class PasswordIsEmpty extends EditProfileDartState {}

/// State representing an empty phone number input field.
class PhoneNumberIsEmpty extends EditProfileDartState {}

/// State representing an invalid phone number input.
class PhoneNumberIsInvalid extends EditProfileDartState {}



