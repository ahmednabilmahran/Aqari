// ignore_for_file: lines_longer_than_80_chars

part of 'edit_profile_cubit.dart';

/// The base class for the edit profile state.
abstract class EditProfileState {
  /// Constructor for the base [EditProfileState] class.
  const EditProfileState();
}

/// Initial state of the edit profile process.
class EditProfileInitial extends EditProfileState {}

/// Initial state of the sign-up process.
///
/// This state is emitted when the sign-up process has not started yet or has been reset.
class EditProfileSignUpInitial extends EditProfileState {}

/// State representing the visibility change of the password input field.
///
/// This state is emitted when the visibility of the password input field is toggled.
class PasswordChangeVisibleState extends EditProfileState {}

/// State representing the loading state of the sign-up process.
///
/// This state is emitted when the sign-up process is underway, indicating that the
/// user should wait for the process to complete.
class SignUpLoadingState extends EditProfileState {}

/// State representing an error that occurred during the sign-up process.
///
/// This state is emitted when an error occurs during the sign-up process, providing
/// an error message to be displayed to the user.
class SignUpErrorState extends EditProfileState {
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
class SignUpSuccessState extends EditProfileState {}

/// State representing the first-time focus on the password input field.
///
/// This state is emitted when the password input field is focused for the first time.
class PasswordFieldIsFirstTimeFocused extends EditProfileState {}

/// State representing the result of the password compliance check.
///
/// This state is emitted when the password input is checked for compliance with password policies.
class SignUpPasswordChecked extends EditProfileState {}

/// for the first name input field.
class FirstNameIsEmpty extends EditProfileState {}

/// State representing an invalid first name input.
class FirstNameIsInvalid extends EditProfileState {}

/// State representing an empty last name input field.
class LastNameIsEmpty extends EditProfileState {}

/// State representing an invalid last name input.
class LastNameIsInvalid extends EditProfileState {}

/// State representing an empty email input field.
class EmailIsInvalid extends EditProfileState {}

/// State representing an invalid email input.
class PasswordIsInvalid extends EditProfileState {}

/// State representing an empty password input field.
class PasswordIsEmpty extends EditProfileState {}

/// State representing an empty phone number input field.
class PhoneNumberIsEmpty extends EditProfileState {}

/// State representing an invalid phone number input.
class PhoneNumberIsInvalid extends EditProfileState {}
