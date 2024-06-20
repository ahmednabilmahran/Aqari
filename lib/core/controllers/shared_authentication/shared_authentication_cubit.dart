// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:aqari/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'shared_authentication_state.dart';

/// Manages the authentication process, encapsulating the logic and state management for the operation.
@lazySingleton
class SharedAuthenticationCubit extends Cubit<SharedAuthenticationState> {
  /// Constructs an instance of [SharedAuthenticationCubit].
  SharedAuthenticationCubit() : super(SharedAuthenticationInitial());
  late StreamSubscription<AuthState> _authChangeListener;

  @override
  Future<void> close() {
    _authChangeListener.cancel();
    return super.close();
  }

  /// Method to check the current authentication status.
  Future<void> checkAuthenticationStatus() async {
    _authChangeListener = supabaseClient.auth.onAuthStateChange.listen(
      (data) {
        switch (data.event) {
          case AuthChangeEvent.signedIn:
            if (data.session != null) {
              emit(SharedAuthenticationAuthenticatedState(data.session!.user));
            }
          case AuthChangeEvent.signedOut:
            emit(SharedAuthenticationUnAuthenticatedState());
          case AuthChangeEvent.tokenRefreshed:
            if (data.session != null) {
              emit(SharedAuthenticationAuthenticatedState(data.session!.user));
            }
          case AuthChangeEvent.userUpdated:
            if (data.session != null) {
              emit(SharedAuthenticationAuthenticatedState(data.session!.user));
            }
          case AuthChangeEvent.passwordRecovery:
            // Handle password recovery if needed
            break;
          case AuthChangeEvent.initialSession:
            if (data.session != null) {
              emit(SharedAuthenticationAuthenticatedState(data.session!.user));
            } else {
              emit(SharedAuthenticationUnAuthenticatedState());
            }
          case AuthChangeEvent.userDeleted:
            emit(SharedAuthenticationUnAuthenticatedState());
          case AuthChangeEvent.mfaChallengeVerified:
        }
      },
    );

    final user = supabaseClient.auth.currentUser;
    if (user != null) {
      emit(SharedAuthenticationAuthenticatedState(user));
    } else {
      emit(SharedAuthenticationUnAuthenticatedState());
    }
  }

  // Add other authentication-related methods here
  // Such as signIn, signOut, etc.
}

/// Enum representing the type of profile being managed.
enum ProfileType {
  /// The profile is for a customer.
  customer,

  /// The profile is for a merchant.
  merchant
}
