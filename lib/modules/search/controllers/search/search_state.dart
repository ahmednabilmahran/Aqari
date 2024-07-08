part of 'search_cubit.dart';

/// SearchState
abstract class SearchState {}

/// SearchInitial
class SearchInitial extends SearchState {}

/// SearchLoading
class SearchLoading extends SearchState {}

/// SearchLoaded
class SearchLoaded extends SearchState {
  /// SearchLoaded
  SearchLoaded(this.units);

  /// units
  final List<UnitModel> units;
}

/// SearchError
class SearchError extends SearchState {
  /// SearchError
  SearchError(this.error);

  /// error
  final String error;
}
