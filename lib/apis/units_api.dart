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
}
