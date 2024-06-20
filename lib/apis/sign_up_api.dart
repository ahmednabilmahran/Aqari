// ignore_for_file: lines_longer_than_80_chars

import 'package:aqari/main.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton

/// [SignUpApi] provides methods for user sign-up and profile updates
/// using Supabase's authentication system.
class SignUpApi {
  /// Initiates the sign-up process for a customer using their phone number and password.
  ///
  /// Parameters:
  ///   - [phone]: The phone number of the customer signing up.
  ///   - [password]: The password chosen by the customer for their account.
  ///   - [firstName]: The user's first name.
  ///   - [lastName]: The user's last name.
  ///   - [dialCode]: The dial code for the user's phone number (optional).
  ///
  /// Returns:
  ///   A [Future] that resolves to an [AuthResponse] object containing the result
  ///   of the sign-up operation, including user details and session information
  ///   if the sign-up was successful.
  Future<AuthResponse> signUpWithPhone({
    required String phone,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final signUpResponse = await supabaseClient.auth.signUp(
      phone: phone,
      password: password,
      data: {
        'first_name': firstName,
        'last_name': lastName,
      },
    );

    return signUpResponse;
  }

  /// Updates the user profile information in the 'profiles' table.
  ///
  /// Parameters:
  ///   - [email]: The user's email address.
  ///
  /// Returns:
  ///   A [Future] that resolves to a [UserResponse] object containing the result
  ///   of the update operation.
  Future<UserResponse> updateUserProfile({
    required String email,
  }) async {
    final updateResponse = await supabaseClient.auth.updateUser(
      UserAttributes(
        email: email,
      ),
    );

    return updateResponse;
  }

  /// Deletes a user by their ID using the service_role key.
  Future<void> deleteUser(String userId) async {
    await supabaseClient.auth.admin.deleteUser(userId);
  }
}
