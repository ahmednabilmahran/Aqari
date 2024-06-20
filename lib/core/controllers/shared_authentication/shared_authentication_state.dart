part of 'shared_authentication_cubit.dart';

/// The base state for authentication which all other states will extend.
abstract class SharedAuthenticationState extends Equatable {
  /// The base state for authentication which all other states will extend.
  const SharedAuthenticationState();

  @override
  List<Object?> get props => [];
}

/// The initial state before any authentication has occurred.
class SharedAuthenticationInitial extends SharedAuthenticationState {}

/// The state when a user is successfully authenticated.
class SharedAuthenticationAuthenticatedState extends SharedAuthenticationState {
  /// The state when a user is successfully authenticated.
  const SharedAuthenticationAuthenticatedState(this.user);

  /// The user that has been authenticated.
  final User user;

  @override
  List<Object?> get props => [user];
}

/// The state when a user is not authenticated.
class SharedAuthenticationUnAuthenticatedState
    extends SharedAuthenticationState {}
