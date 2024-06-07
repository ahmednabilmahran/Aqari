// ignore_for_file: lines_longer_than_80_chars

import 'package:aqari/apis/sign_up_api.dart';
import 'package:aqari/core/utils/countries_helper.dart';
import 'package:aqari/main.dart';
import 'package:aqari/models/aqari_country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

/// [SignUpCubit] is responsible for managing the state of the customer sign-up process.
///
/// It handles form validations, navigations between the sign-up steps, and the visibility of the password field.
class SignUpCubit extends Cubit<SignUpState> {
  /// Initializes the cubit with the initial sign-up state.
  SignUpCubit({
    required this.signUpApi,
  }) : super(SignUpInitial()) {
    setupPasswordFocusListener();
  }

  /// The API service for signing up a customer with a phone and password.
  final SignUpApi signUpApi;

  /// GlobalKey for the sign-up form, used for validation and form control.
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /// Controller for the email input field.
  final TextEditingController emailController = TextEditingController();

  /// Controller for the first name input field.
  final TextEditingController firstNameController = TextEditingController();

  /// Controller for the last name input field.
  final TextEditingController lastNameController = TextEditingController();

  /// Controller for the phone number input field.
  final TextEditingController phoneNumberController = TextEditingController();

  /// The currently selected country model for the phone number.
  AqariCountryModel selectedCountry = CountriesHelper.countries.first;

  /// Controller for the email verification input field.
  final TextEditingController verificationController = TextEditingController();

  /// Controller for the password input field.
  final TextEditingController passwordController = TextEditingController();

  /// FocusNode for the password input field, used to detect focus changes.
  final FocusNode passwordFocusNode = FocusNode();

  /// Tracks if the password field has been focused for the first time to manage focus-related states.
  bool isPasswordFocusedFirstTime = true;

  /// Controls the visibility of the password, toggling between plain text and obscured text.
  bool isPasswordVisible = false;

  /// The current state of the password input field.
  bool hasMinLength = false;

  /// The current state of the password input field.
  bool hasNumber = false;

  /// The current state of the password input field.
  bool hasSpecialChar = false;

  /// The current state of the password input field.
  bool passwordsIsEqualed = false;

  /// Processes the continuation of the sign-up process with phone validation.
  ///
  /// Validates the phone form and navigates to the email verification step if successful.
  Future<void> signUpWithPhone() async {
    if (signUpFormKey.currentState!.validate() &&
        passwordsIsEqualed &&
        hasMinLength &&
        hasNumber &&
        hasSpecialChar) {
      emit(SignUpLoadingState());

      try {
        final result = await signUpApi.signUpWithPhone(
          phone: phoneNumberController.text,
          password: passwordController.text,
        );

        if (result.user != null) {
          final profileUpdateResult = await signUpApi.updateProfile(
            userId: supabaseClient.auth.currentUser!.id,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            dialCode: selectedCountry.dialCode,
          );

          if (profileUpdateResult) {
            await supabaseClient.auth.refreshSession();
            emit(SignUpSuccessState());
          } else {
            emit(const SignUpErrorState('Profile update failed'));
          }
        } else {
          emit(const SignUpErrorState('Sign up failed'));
        }
      } catch (e) {
        emit(SignUpErrorState(e.toString()));
      }
    }
  }

  /// Toggles the visibility of the password field between obscured and plain text.
  void toggleIsPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordChangeVisibleState());
  }

  /// Checks the password input for compliance with password policies (length, numbers, special characters).
  ///
  /// Emits appropriate states based on the validation results.
  /// - Parameter value: The current value of the password input field.
  void checkOnPassword(String? value) {
    hasMinLength = value!.length >= 8;
    hasNumber = value.contains(RegExp('[0-9]'));
    hasSpecialChar =
        value.contains(RegExp(r'[!@#\$&*~.,:;^%(){}[\]<>?/\\|\-_=+]'));
    passwordsIsEqualed = passwordController.text == verificationController.text;

    emit(
      SignUpPasswordChecked(),
    );
  }

  /// Checks the verification password
  void checkOnVerificationPassword(String? value) {
    passwordsIsEqualed = passwordController.text == verificationController.text;

    emit(
      SignUpPasswordChecked(),
    );
  }

  /// Sets up a focus listener for the password field to manage focus-related states.
  void setupPasswordFocusListener() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus && isPasswordFocusedFirstTime) {
        emit(PasswordFieldIsFirstTimeFocused());
        isPasswordFocusedFirstTime = false;
      }
    });
  }

  /// checks if the first name empty or not
  void firstNameIsEmpty() {
    emit(FirstNameIsEmpty());
  }

  /// checks if the first name is invalid or not
  void firstNameIsInvalid() {
    emit(FirstNameIsInvalid());
  }

  /// checks if the last name empty or not
  void lastNameIsEmpty() {
    emit(LastNameIsEmpty());
  }

  /// checks if the last name is invalid or not
  void lastNameIsInvalid() {
    emit(LastNameIsInvalid());
  }

  /// checks if the email is invalid or not
  void emailIsInvalid() {
    emit(EmailIsInvalid());
  }

  /// checks if the password is empty or not
  void passwordIsEmpty() {
    emit(PasswordIsEmpty());
  }

  /// checks if the password is invalid or not
  void passwordIsInvalid() {
    emit(PasswordIsInvalid());
  }

  /// checks if the phone number empty or not
  void phoneNumberIsEmpty() {
    emit(PhoneNumberIsEmpty());
  }

  /// checks if the phone number is invalid or not
  void phoneNumberIsInvalid() {
    emit(PhoneNumberIsInvalid());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    verificationController.dispose();
    return super.close();
  }
}
