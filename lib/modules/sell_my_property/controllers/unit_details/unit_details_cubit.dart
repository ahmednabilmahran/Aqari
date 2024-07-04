import 'package:aqari/core/utils/countries_helper.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/models/aqari_country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'unit_details_state.dart';

/// Unit Details Cubit
class UnitDetailsCubit extends Cubit<UnitDetailsState> {
  /// Constructor
  UnitDetailsCubit()
      : super(
          UnitDetailsState(
            selectedCategory: S.current.house,
            titleController: TextEditingController(),
            titleFocusNode: FocusNode(),
            unitGeneralDetailsScrollController: ScrollController(),
            bedroomCount: 0,
            bathroomCount: 0,
            balconyCount: 0,
            selectedFloor: S.current.ground,
            selectedFacilities: [],
            addressLine1Controller: TextEditingController(),
            addressLine2Controller: TextEditingController(),
            cityController: TextEditingController(),
            countries: CountriesHelper.countries,
            selectedCountry: null,
          ),
        );

  /// Load Countries (Example method to load countries, implement as needed)
  void loadCountries(List<AqariCountryModel> countries) {
    emit(state.copyWith(countries: countries));
  }

  /// Select Country
  void selectCountry(AqariCountryModel country) {
    emit(state.copyWith(selectedCountry: country));
  }

  /// Select Category
  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  /// Increment Bedroom Count
  void incrementBedroomCount() {
    if (state.bedroomCount < 10) {
      emit(state.copyWith(bedroomCount: state.bedroomCount + 1));
    }
  }

  /// Decrement Bedroom Count
  void decrementBedroomCount() {
    if (state.bedroomCount > 0) {
      emit(state.copyWith(bedroomCount: state.bedroomCount - 1));
    }
  }

  /// Increment Bathroom Count
  void incrementBathroomCount() {
    if (state.bathroomCount < 10) {
      emit(state.copyWith(bathroomCount: state.bathroomCount + 1));
    }
  }

  /// Decrement Bathroom Count
  void decrementBathroomCount() {
    if (state.bathroomCount > 0) {
      emit(state.copyWith(bathroomCount: state.bathroomCount - 1));
    }
  }

  /// Increment Balcony Count
  void incrementBalconyCount() {
    if (state.balconyCount < 10) {
      emit(state.copyWith(balconyCount: state.balconyCount + 1));
    }
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

  /// Validate inputs
  bool validateGeneralInputs() {
    return state.titleController.text.isNotEmpty &&
        state.bedroomCount > 0 &&
        state.bathroomCount > 0 &&
        state.balconyCount > 0 &&
        state.selectedFacilities.isNotEmpty;
  }

  @override
  Future<void> close() {
    state.titleController.dispose();
    state.titleFocusNode.dispose();
    state.unitGeneralDetailsScrollController.dispose();
    state.addressLine1Controller.dispose();
    state.addressLine2Controller.dispose();
    state.cityController.dispose();
    return super.close();
  }
}
