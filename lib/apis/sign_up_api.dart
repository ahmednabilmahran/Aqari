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
  /// This method creates a new user account in the Supabase authentication system.
  ///
  /// Parameters:
  ///   - [phone]: The phone number of the customer signing up.
  ///   - [password]: The password chosen by the customer for their account.
  ///
  /// Returns:
  ///   A [Future] that resolves to an [AuthResponse] object containing the result
  ///   of the sign-up operation, including user details and session information
  ///   if the sign-up was successful.
  Future<AuthResponse> signUpWithPhone({
    required String phone,
    required String password,
  }) async {
    final result = await supabaseClient.auth.signUp(
      phone: phone,
      password: password,
    );
    return result;
  }

  /// Updates the user profile information in the 'profiles' table.
  ///
  /// This method updates the user's profile details including their first name,
  /// last name, and email. It assumes a 'profiles' table exists with
  /// columns for these details and an 'id' column that matches the user's ID in
  /// the Supabase authentication system.
  ///
  /// Parameters:
  ///   - [userId]: The unique identifier of the user in the Supabase authentication system.
  ///   - [firstName]: The user's first name.
  ///   - [lastName]: The user's last name.
  ///   - [email]: The user's email address.
  ///   - [profileType]: The type of profile to be updated (e.g., customer, merchant, etc.).
  ///   - [dialCode]: The dial code for the user's phone number (optional).
  ///
  /// Returns:
  ///   A [Future] that resolves to a boolean value indicating the success (`true`)
  ///   or failure (`false`) of the update operation.
  Future<bool> updateProfile({
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    String? dialCode,
  }) async {
    final profileData = {
      'id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    };
    if (dialCode != null) {
      profileData['dial_code'] = dialCode;
    }

    final result =
        await supabaseClient.from('profiles').upsert(profileData).then(
              (value) => true,
              onError: (error, stackTrace) => false,
            );
    return result;
  }
}
