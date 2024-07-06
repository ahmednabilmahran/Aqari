import 'package:aqari/core/utils/countries_helper.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/models/aqari_country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

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
            selectedCountry: CountriesHelper.countries.first,
            selectedCountryCode: CountriesHelper.countries.first.code,
            selectedCountryCenter:
                const LatLng(30.044394026989863, 31.23564798384905), // Egypt
            images: [],
          ),
        );

  /// Load Countries (Example method to load countries, implement as needed)
  void loadCountries(List<AqariCountryModel> countries) {
    emit(state.copyWith(countries: countries));
  }

  /// Select Country
  void selectCountry(AqariCountryModel country) {
    LatLng initialCenter;
    switch (country.code) {
      case 'EG':
        initialCenter =
            const LatLng(30.044394026989863, 31.23564798384905); // Egypt
      case 'US':
        initialCenter = const LatLng(37.0902, -95.7129); // United States
      case 'NG':
        initialCenter = const LatLng(9.0820, 8.6753); // Nigeria
      case 'RW':
        initialCenter = const LatLng(-1.9403, 29.8739); // Rwanda
      case 'GH':
        initialCenter = const LatLng(7.9465, -1.0232); // Ghana
      default:
        initialCenter = const LatLng(
          30.044394026989863,
          31.23564798384905,
        ); // Default to Tahrir
    }

    emit(
      state.copyWith(
        selectedCountry: country,
        selectedCountryCode: country.code,
        selectedCountryCenter: initialCenter,
      ),
    );
  }

  /// Get Permissions
  Future<void> getPermissions() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        // ignore: lines_longer_than_80_chars
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
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
        state.selectedFacilities.isNotEmpty;
  }

  /// Validate Address Inputs
  bool validateAddressInputs() {
    return state.addressLine1Controller.text.isNotEmpty &&
        state.cityController.text.isNotEmpty &&
        state.selectedLocation != null;
  }

  /// Validate Address Inputs
  bool validateGalleryInputs() {
    return state.images.isNotEmpty;
  }

  /// Update Location
  void updateLocation(double latitude, double longitude) {
    // Generate the URL of the captured map with the pin
    final mapUrl =
        'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=650x350&maptype=roadmap&markers=color:0xB5854B%7C$latitude,$longitude&key=AIzaSyDRO-bkN2PHsgaXmV9LUfaQXDASjQfrZ3g';
    emit(
      state.copyWith(
        selectedLocation: LatLng(latitude, longitude),
        selectedLocationMapUrl: mapUrl,
      ),
    );
  }

  /// Add Images
  Future<void> addImages() async {
    try {
      final picker = ImagePicker();
      final pickedFiles = await picker.pickMultiImage();
      final newImages = pickedFiles.map((file) => file.path).toList();
      final allImages = List<String>.from(state.images)..addAll(newImages);
      if (allImages.length > 20) {
        SnackX.showSnackBar(message: 'You can only add up to 20 images.');
        return;
      }
      emit(state.copyWith(images: allImages));
    } catch (e) {
      // Handle any errors that might occur
      debugPrint('Error picking images: $e');
      SnackX.showSnackBar(message: 'Error picking images: $e');
    }
  }

  /// Remove Image
  void removeImage(int index) {
    final updatedImages = List<String>.from(state.images)..removeAt(index);
    emit(state.copyWith(images: updatedImages));
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
