// ignore_for_file: lines_longer_than_80_chars

part of 'login_cubit.dart';

/// Abstract base class representing the various states of the customer login process.
abstract class LoginState {
  /// Constructor for the base [LoginState] class.
  const LoginState();
}

/// Initial state of the customer login process.
///
/// This state is emitted when the login process has not started yet or has been reset.
class LoginInitial extends LoginState {}

/// State representing the visibility change of the password input field.
///
/// This state is emitted when the visibility of the password input field is toggled.
class PasswordChangeVisibleState extends LoginState {}

/// State representing the loading state of the customer login process.
///
/// This state is emitted when the login process is underway, indicating that the
/// user should wait for the process to complete.
class LoginLoadingState extends LoginState {}

/// State representing an error that occurred during the customer login process.
///
/// This state is emitted when an error occurs during the login process, providing
/// an error message to be displayed to the user.
class LoginErrorState extends LoginState {
  /// Constructor for the [LoginErrorState] class.
  ///
  /// Parameters:
  /// - [message]: The error message describing what went wrong during the login process.
  const LoginErrorState(this.message);

  /// The error message describing what went wrong during the login process.
  final String message;
}

/// State representing the successful completion of the customer login process.
///
/// This state is emitted when the user has been successfully authenticated.
class LoginSuccessState extends LoginState {}

/// This state is emitted when the visibility of the password input field is toggled.
class PasswordTextFieldChangeVisibleState extends LoginState {}

/// State representing an empty phone number input field.
class PhoneNumberIsEmpty extends LoginState {}

/// State representing an invalid phone number input.
class PhoneNumberIsInvalid extends LoginState {}

/// State representing an empty password input field.
class PasswordIsEmpty extends LoginState {}
