part of 'unit_details_cubit.dart';

/// Unit Details State
class UnitDetailsState {
  /// Constructor
  UnitDetailsState({
    required this.selectedCategory,
    required this.titleController,
    required this.titleFocusNode,
    required this.bedroomCount,
    required this.bathroomCount,
    required this.balconyCount,
    required this.selectedFloor,
    required this.selectedFacilities,
    required this.unitGeneralDetailsScrollController,
    required this.addressLine1Controller,
    required this.addressLine2Controller,
    required this.cityController,
    required this.countries,
    required this.selectedCountry,
  });

  /// Selected Category
  final String selectedCategory;

  /// Title Controller
  final TextEditingController titleController;

  /// Title Focus Node
  final FocusNode titleFocusNode;

  /// Bedroom Count
  final int bedroomCount;

  /// Bathroom Count
  final int bathroomCount;

  /// Balcony Count
  final int balconyCount;

  /// Selected Floor
  final String selectedFloor;

  /// Selected Facilities
  final List<String> selectedFacilities;

  /// Scroll Controller
  final ScrollController unitGeneralDetailsScrollController;

  /// Address Line 1 Controller
  final TextEditingController addressLine1Controller;

  /// Address Line 2 Controller
  final TextEditingController addressLine2Controller;

  /// City Controller
  final TextEditingController cityController;

  /// List of Countries
  final List<AqariCountryModel> countries;

  /// Selected Country
  final AqariCountryModel? selectedCountry;

  /// Copy With
  UnitDetailsState copyWith({
    String? selectedCategory,
    TextEditingController? titleController,
    FocusNode? titleFocusNode,
    int? bedroomCount,
    int? bathroomCount,
    int? balconyCount,
    String? selectedFloor,
    List<String>? selectedFacilities,
    ScrollController? unitGeneralDetailsScrollController,
    TextEditingController? addressLine1Controller,
    TextEditingController? addressLine2Controller,
    TextEditingController? cityController,
    List<AqariCountryModel>? countries,
    AqariCountryModel? selectedCountry,
  }) {
    return UnitDetailsState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      titleController: titleController ?? this.titleController,
      titleFocusNode: titleFocusNode ?? this.titleFocusNode,
      bedroomCount: bedroomCount ?? this.bedroomCount,
      bathroomCount: bathroomCount ?? this.bathroomCount,
      balconyCount: balconyCount ?? this.balconyCount,
      selectedFloor: selectedFloor ?? this.selectedFloor,
      selectedFacilities: selectedFacilities ?? this.selectedFacilities,
      unitGeneralDetailsScrollController: unitGeneralDetailsScrollController ??
          this.unitGeneralDetailsScrollController,
      addressLine1Controller:
          addressLine1Controller ?? this.addressLine1Controller,
      addressLine2Controller:
          addressLine2Controller ?? this.addressLine2Controller,
      cityController: cityController ?? this.cityController,
      countries: countries ?? this.countries,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }
}
