import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custom_filter_state.dart';

/// Custom Filter Cubit
class CustomFilterCubit extends Cubit<CustomFilterState> {
  /// Constructor
  CustomFilterCubit() : super(CustomFilterState()) {
    _tempState = state;
    minAreaController = TextEditingController();
    maxAreaController = TextEditingController();
  }

  CustomFilterState _appliedState = CustomFilterState();
  late CustomFilterState _tempState;

  /// Min Area Controller
  late TextEditingController minAreaController;

  /// Max Area Controller
  late TextEditingController maxAreaController;

  /// Update Property Type
  void updatePropertyType(String? propertyType) {
    _tempState = _tempState.copyWith(propertyType: propertyType);
    emit(_tempState);
  }

  /// Update Minimum Area
  void updateMinArea(String? minArea) {
    _tempState = _tempState.copyWith(minArea: minArea);
    emit(_tempState);
  }

  /// Update Maximum Area
  void updateMaxArea(String? maxArea) {
    _tempState = _tempState.copyWith(maxArea: maxArea);
    emit(_tempState);
  }

  /// Update Selected Floors
  void updateSelectedFloors(List<String> selectedFloors) {
    _tempState = _tempState.copyWith(selectedFloors: selectedFloors);
    emit(_tempState);
  }

  /// Reset Filters
  void resetFilters() {
    _tempState = CustomFilterState();
    minAreaController.clear();
    maxAreaController.clear();
    emit(_tempState);
  }

  /// Apply Filters
  void applyFilters() {
    _appliedState = _tempState;
    emit(_appliedState);
  }

  /// Get Applied Filters
  CustomFilterState getAppliedFilters() {
    return _appliedState;
  }

  /// Load Applied Filters
  void loadAppliedFilters() {
    _tempState = _appliedState;
    minAreaController.text = _tempState.minArea ?? '';
    maxAreaController.text = _tempState.maxArea ?? '';
    emit(_tempState);
  }

  @override
  Future<void> close() {
    minAreaController.dispose();
    maxAreaController.dispose();
    return super.close();
  }
}
