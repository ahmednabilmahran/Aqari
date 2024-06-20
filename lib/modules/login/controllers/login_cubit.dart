// ignore_for_file: lines_longer_than_80_chars

import 'package:aqari/apis/login_api.dart';
import 'package:aqari/core/utils/countries_helper.dart';
import 'package:aqari/main.dart';
import 'package:aqari/models/aqari_country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

/// [LoginCubit] is responsible for managing the state of the login process,
/// including user input validation, password visibility, and authentication.
class LoginCubit extends Cubit<LoginState> {
  /// Constructs a [LoginCubit] instance with a dependency on [LoginApi].
  LoginCubit(this._loginService) : super(LoginInitial());

  /// The login service used to perform authentication operations.
  final LoginApi _loginService;

  /// The currently selected country model for the phone number.
  AqariCountryModel selectedCountry = CountriesHelper.countries.first;

  /// The form key for the login form.
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// The controller for the phone input field.
  TextEditingController phoneController = TextEditingController();

  /// The controller for the password input field.
  TextEditingController passwordController = TextEditingController();

  /// The visibility of the password field.
  bool isPasswordFieldVisible = false;

  /// Indicates whether the password is currently visible in the UI.
  bool isPasswordVisible = false;

  /// Toggles the visibility of the password field.
  void toggleIsPasswordFieldVisible() {
    isPasswordFieldVisible = true;
    emit(PasswordTextFieldChangeVisibleState());
  }

  /// Toggles the visibility of the password in the UI and emits a state update
  /// to trigger UI changes.
  void toggleIsPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordChangeVisibleState());
  }

  /// Validates the login form and initiates the login process if valid.
  ///
  /// This method handles the asynchronous login operation by:
  /// - Emitting [LoginLoadingState] while the login process is underway.
  /// - Upon completion, it either emits [LoginErrorState] with an error message
  ///   if the login fails, or [LoginSuccessState] upon successful authentication.
  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginLoadingState());

      try {
        final result = await _loginService.loginWithPhone(
          phone: selectedCountry.dialCode + phoneController.text,
          password: passwordController.text,
        );
        if (result.user != null) {
          await supabaseClient.auth.refreshSession();
          emit(LoginSuccessState());
        }
      } catch (e) {
        if (e is AuthApiException) {
          emit(LoginErrorState(e.message));
        } else {
          emit(LoginErrorState(e.toString()));
        }
      }
    }
  }

  /// Disposes the controllers when the cubit is closed.
  ///
  /// This method ensures that resources are properly released to avoid memory leaks.
  @override
  Future<void> close() {
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }

  /// checks if the phone number empty or not
  void phoneNumberIsEmpty() {
    emit(PhoneNumberIsEmpty());
  }

  /// checks if the phone number is invalid or not
  void phoneNumberIsInvalid() {
    emit(PhoneNumberIsInvalid());
  }

  /// checks if the password is empty or not
  void passwordIsEmpty() {
    emit(PasswordIsEmpty());
  }
}
