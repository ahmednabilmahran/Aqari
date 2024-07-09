part of 'favorites_cubit.dart';

/// FavoritesState class
abstract class FavoritesState {
  /// FavoritesState constructor
  const FavoritesState();
}

/// FavoritesInitial class
class FavoritesInitial extends FavoritesState {}

/// FavoritesLoading class
class FavoritesLoading extends FavoritesState {}

/// FavoritesLoaded class
class FavoritesLoaded extends FavoritesState {
  /// FavoritesLoaded constructor
  const FavoritesLoaded(this.favorites);

  /// List of favorite units
  final List<UnitModel> favorites;
}

/// FavoritesError class
class FavoritesError extends FavoritesState {
  /// FavoritesError constructor
  const FavoritesError(this.error);

  /// Error message
  final String error;
}
