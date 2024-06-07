// ignore_for_file: lines_longer_than_80_chars

import 'package:aqari/main.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton

/// [LoginApi] provides methods for user authentication and password management
/// using Supabase's authentication system.
class LoginApi {
  /// Authenticates a user with their phone number and password.
  ///
  /// This method uses Supabase's `signInWithPassword` function to authenticate
  /// the user. It requires the user's phone number and password as input parameters.
  ///
  /// Parameters:
  /// - [phone]: The phone number of the user attempting to log in.
  /// - [password]: The password associated with the user's account.
  ///
  /// Returns:
  /// A [Future] that resolves to an [AuthResponse] containing the authentication result,
  /// including user information and session details.
  Future<AuthResponse> loginWithPhone({
    required String phone,
    required String password,
  }) async {
    final result = await supabaseClient.auth.signInWithPassword(
      phone: phone,
      password: password,
    );
    return result;
  }

  /// Initiates a password reset process for a user by their email address.
  ///
  /// This method sends a password reset email to the specified email address
  /// using Supabase's `resetPasswordForEmail` function.
  ///
  /// Parameters:
  /// - [email]: The email address associated with the user's account.
  ///
  /// Returns:
  /// A [Future] that completes once the password reset email has been sent.
  Future<void> resetPasswordForEmail({
    required String email,
  }) async {
    await supabaseClient.auth.resetPasswordForEmail(email);
  }

  /// Updates the user's password to a new value.
  ///
  /// This method allows a user to update their password using Supabase's
  /// `updateUser` function. The user must be authenticated or have a valid session
  /// to perform this operation.
  ///
  /// Parameters:
  /// - [newPassword]: The new password to be set for the user's account.
  ///
  /// Returns:
  /// A [Future] that resolves to a [UserResponse] containing the result of the password
  /// update operation, including updated user information if the operation was successful.
  Future<UserResponse> addNewPassword({
    required String newPassword,
  }) async {
    final result = await supabaseClient.auth.updateUser(
      UserAttributes(
        password: newPassword,
      ),
    );
    return result;
  }
}
