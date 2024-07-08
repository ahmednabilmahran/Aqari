part of 'units_cubit.dart';

/// [UnitsState] abstract class.
abstract class UnitsState {}

/// [UnitsInitial] class.
class UnitsInitial extends UnitsState {}

/// [UnitsLoading] class.
class UnitsLoading extends UnitsState {}

/// [UnitsLoaded] class.
class UnitsLoaded extends UnitsState {
  /// [UnitsLoaded] constructor.
  UnitsLoaded(
    this.highlightedUnits,
    this.featuredUnits,
    this.allUnits,
    this.nearYouUnits,
  );

  /// [highlightedUnits] variable.
  final List<UnitModel> highlightedUnits;

  /// [featuredUnits] variable.
  final List<UnitModel> featuredUnits;

  /// [allUnits] variable.
  final List<UnitModel> allUnits;

  /// [nearYouUnits] variable.
  final List<UnitModel> nearYouUnits;
}

/// [UnitsError] class.
class UnitsError extends UnitsState {
  /// UnitsError
  UnitsError(this.error);

  /// error
  final String error;
}
