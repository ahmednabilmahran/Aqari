import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'unit_details_state.dart';

/// Unit Details Cubit
class UnitDetailsCubit extends Cubit<UnitDetailsState> {
  /// Constructor
  UnitDetailsCubit()
      : super(
          UnitDetailsState(
            selectedCategory: 'House',
            titleController: TextEditingController(),
            bedroomCount: 3,
            bathroomCount: 2,
            balconyCount: 2,
            selectedFloor: 'Ground',
            selectedFacilities: [],
          ),
        );

  /// Select Category
  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  /// Increment Bedroom Count
  void incrementBedroomCount() {
    emit(state.copyWith(bedroomCount: state.bedroomCount + 1));
  }

  /// Decrement Bedroom Count
  void decrementBedroomCount() {
    if (state.bedroomCount > 0) {
      emit(state.copyWith(bedroomCount: state.bedroomCount - 1));
    }
  }

  /// Increment Bathroom Count
  void incrementBathroomCount() {
    emit(state.copyWith(bathroomCount: state.bathroomCount + 1));
  }

  /// Decrement Bathroom Count
  void decrementBathroomCount() {
    if (state.bathroomCount > 0) {
      emit(state.copyWith(bathroomCount: state.bathroomCount - 1));
    }
  }

  /// Increment Balcony Count
  void incrementBalconyCount() {
    emit(state.copyWith(balconyCount: state.balconyCount + 1));
  }

  /// Decrement Balcony Count
  void decrementBalconyCount() {
    if (state.balconyCount > 0) {
      emit(state.copyWith(balconyCount: state.balconyCount - 1));
    }
  }

  /// Select Floor
  void selectFloor(String floor) {
    emit(state.copyWith(selectedFloor: floor));
  }

  /// Toggle Facility
  void toggleFacility(String facility) {
    final selectedFacilities = List<String>.from(state.selectedFacilities);
    if (selectedFacilities.contains(facility)) {
      selectedFacilities.remove(facility);
    } else {
      selectedFacilities.add(facility);
    }
    emit(state.copyWith(selectedFacilities: selectedFacilities));
  }

  @override
  Future<void> close() {
    state.titleController.dispose();
    return super.close();
  }
}
