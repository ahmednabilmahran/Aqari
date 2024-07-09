import 'package:aqari/main.dart';
import 'package:aqari/models/unit_image_model.dart';

/// UnitImagesApi class
class UnitImagesApi {
  /// fetchUnitImages method
  Future<List<UnitImageModel>> fetchUnitImages(int unitId) async {
    final response =
        await supabaseClient.from('unit_images').select().eq('unit_id', unitId);

    return response.map<UnitImageModel>(UnitImageModel.fromJson).toList();
  }
}
