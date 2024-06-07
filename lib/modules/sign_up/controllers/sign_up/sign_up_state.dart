// ignore_for_file: lines_longer_than_80_chars

part of 'sign_up_cubit.dart';

/// Abstract base class representing the various states of the sign-up process.
abstract class SignUpState {
  /// Constructor for the base [SignUpState] class.
  const SignUpState();
}

/// Initial state of the sign-up process.
///
/// This state is emitted when the sign-up process has not started yet or has been reset.
class SignUpInitial extends SignUpState {}

/// State representing the visibility change of the password input field.
///
/// This state is emitted when the visibility of the password input field is toggled.
class PasswordChangeVisibleState extends SignUpState {}

/// State representing the loading state of the sign-up process.
///
/// This state is emitted when the sign-up process is underway, indicating that the
/// user should wait for the process to complete.
class SignUpLoadingState extends SignUpState {}

/// State representing an error that occurred during the sign-up process.
///
/// This state is emitted when an error occurs during the sign-up process, providing
/// an error message to be displayed to the user.
class SignUpErrorState extends SignUpState {
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
class SignUpSuccessState extends SignUpState {}

/// State representing the first-time focus on the password input field.
///
/// This state is emitted when the password input field is focused for the first time.
class PasswordFieldIsFirstTimeFocused extends SignUpState {}

/// State representing the result of the password compliance check.
///
/// This state is emitted when the password input is checked for compliance with password policies.
class SignUpPasswordChecked extends SignUpState {}

/// for the first name input field.
class FirstNameIsEmpty extends SignUpState {}

/// State representing an invalid first name input.
class FirstNameIsInvalid extends SignUpState {}

/// State representing an empty last name input field.
class LastNameIsEmpty extends SignUpState {}

/// State representing an invalid last name input.
class LastNameIsInvalid extends SignUpState {}

/// State representing an empty email input field.
class EmailIsInvalid extends SignUpState {}

/// State representing an invalid email input.
class PasswordIsInvalid extends SignUpState {}

/// State representing an empty password input field.
class PasswordIsEmpty extends SignUpState {}

/// State representing an empty phone number input field.
class PhoneNumberIsEmpty extends SignUpState {}

/// State representing an invalid phone number input.
class PhoneNumberIsInvalid extends SignUpState {}
