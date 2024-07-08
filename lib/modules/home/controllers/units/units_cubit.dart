import 'package:aqari/apis/units_api.dart';
import 'package:aqari/models/unit_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'units_state.dart';

/// [UnitsCubit] class.
class UnitsCubit extends Cubit<UnitsState> {
  /// [UnitsCubit] constructor.
  UnitsCubit(this.api) : super(UnitsInitial());

  /// [api] variable.
  final UnitsApi api;

  /// [fetchUnits] method.
  Future<void> fetchUnits() async {
    try {
      emit(UnitsLoading());

      // Get the current location
      final position = await _determinePosition();

      final highlightedUnits = await api.getHighlightedUnits();
      final featuredUnits = await api.getFeaturedUnits();
      final allUnits = await api.getAllUnits();
      final nearYouUnits =
          await api.getNearYouUnits(position.latitude, position.longitude);

      emit(
        UnitsLoaded(highlightedUnits, featuredUnits, allUnits, nearYouUnits),
      );
    } catch (e) {
      emit(UnitsError(e.toString()));
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, do not continue
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, do not continue
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately
      return Future.error(
        // ignore: lines_longer_than_80_chars
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // ignore: lines_longer_than_80_chars
    // When we reach here, permissions are granted and we can continue accessing the position of the device.
    return Geolocator.getCurrentPosition();
  }
}
