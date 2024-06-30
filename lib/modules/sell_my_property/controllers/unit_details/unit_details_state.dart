part of 'unit_details_cubit.dart';

/// Unit Details State
class UnitDetailsState {
  /// Constructor
  UnitDetailsState({
    required this.selectedCategory,
    required this.titleController,
    required this.bedroomCount,
    required this.bathroomCount,
    required this.balconyCount,
    required this.selectedFloor,
    required this.selectedFacilities,
  });

  /// Selected Category
  final String selectedCategory;

  /// Title Controller
  final TextEditingController titleController;

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

  /// Copy With

  UnitDetailsState copyWith({
    String? selectedCategory,
    TextEditingController? titleController,
    int? bedroomCount,
    int? bathroomCount,
    int? balconyCount,
    String? selectedFloor,
    List<String>? selectedFacilities,
  }) {
    return UnitDetailsState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      titleController: titleController ?? this.titleController,
      bedroomCount: bedroomCount ?? this.bedroomCount,
      bathroomCount: bathroomCount ?? this.bathroomCount,
      balconyCount: balconyCount ?? this.balconyCount,
      selectedFloor: selectedFloor ?? this.selectedFloor,
      selectedFacilities: selectedFacilities ?? this.selectedFacilities,
    );
  }
}
