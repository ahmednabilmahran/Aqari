import 'package:aqari/main.dart';
import 'package:aqari/models/unit_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton

/// UnitsApi class
class UnitsApi {
  /// getHighlightedUnits method
  Future<List<UnitModel>> getHighlightedUnits() async {
    final response = await supabaseClient
        .from('units')
        .select()
        .eq('is_highlighted', true)
        .select();

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// getFeaturedUnits method
  Future<List<UnitModel>> getFeaturedUnits() async {
    final response = await supabaseClient
        .from('units')
        .select()
        .eq('is_featured', true)
        .select();

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// getAllUnits method
  Future<List<UnitModel>> getAllUnits() async {
    final response = await supabaseClient.from('units').select().select();

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// getNearYouUnits method
  Future<List<UnitModel>> getNearYouUnits(
    double latitude,
    double longitude,
  ) async {
    final response = await supabaseClient.rpc<void>(
      'get_nearby_units',
      params: {
        'lat': latitude,
        'long': longitude,
        'radius_km': 15,
      },
    ).select();

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// searchUnits method
  Future<List<UnitModel>> searchUnits(
    String searchTerm,
    String? propertyType,
    String? minArea,
    String? maxArea,
    List<String> selectedFloors,
  ) async {
    var query = supabaseClient.from('units').select();

    if (searchTerm.isNotEmpty) {
      query = query.ilike('title', '%$searchTerm%');
    }

    if (propertyType != null && propertyType.isNotEmpty) {
      query = query.eq('type', propertyType);
    }

    if (minArea != null && minArea.isNotEmpty) {
      query = query.gte('area_sqft', int.parse(minArea));
    }

    if (maxArea != null && maxArea.isNotEmpty) {
      query = query.lte('area_sqft', int.parse(maxArea));
    }

    if (selectedFloors.isNotEmpty) {
      query = query.inFilter('floor', selectedFloors);
    }

    final response = await query;

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// getFavoriteUnits method
  Future<List<UnitModel>> getFavoriteUnits(String userId) async {
    // Step 1: Fetch Favorite Unit IDs
    final unitIdResponse = await supabaseClient
        .from('favorites')
        .select('unit_id')
        .eq('user_id', userId);

    // Extract the unit IDs
    final unitIds = unitIdResponse.map((e) => e['unit_id']).toList();

    // Step 2: Use Unit IDs to Fetch Units
    final unitResponse = await supabaseClient
        .from('units')
        .select()
        .inFilter('unit_id', unitIds);

    return unitResponse.map<UnitModel>(UnitModel.fromJson).toList();
  }
}
