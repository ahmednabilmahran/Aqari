part of 'custom_filter_cubit.dart';

/// Custom Filter State
class CustomFilterState {
  /// Custom Filter State Constructor
  CustomFilterState({
    this.minArea,
    this.maxArea,
    this.propertyType,
    this.selectedFloors = const [],
  });

  /// Property Type
  final String? propertyType;

  /// Minimum Area
  final String? minArea;

  /// Maximum Area
  final String? maxArea;

  /// Selected Floors
  final List<String> selectedFloors;

  /// Copy With
  CustomFilterState copyWith({
    String? propertyType,
    String? minArea,
    String? maxArea,
    List<String>? selectedFloors,
  }) {
    return CustomFilterState(
      propertyType: propertyType ?? this.propertyType,
      minArea: minArea ?? this.minArea,
      maxArea: maxArea ?? this.maxArea,
      selectedFloors: selectedFloors ?? this.selectedFloors,
    );
  }
}
