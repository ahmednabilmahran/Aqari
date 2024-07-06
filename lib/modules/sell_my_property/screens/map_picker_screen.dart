import 'dart:ui' as ui;

import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart'; // Import this package for geocoding
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

/// Map Picker Screen
class MapPickerScreen extends StatefulWidget {
  /// Constructor
  const MapPickerScreen({super.key, this.initialLocation, this.countryCode});

  /// Initial location to be displayed on the map
  final LatLng? initialLocation;

  /// Code of the selected country
  final String? countryCode;

  @override
  // ignore: library_private_types_in_public_api
  _MapPickerScreenState createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  late LatLng? _pickedLocation;
  BitmapDescriptor? _customMarker;

  @override
  void initState() {
    super.initState();
    _pickedLocation = widget.initialLocation;
    _loadCustomMarker();
  }

  Future<void> _loadCustomMarker() async {
    _customMarker = await getSvgMarker(context, Assets.genIconsMapMarker);
    setState(() {});
  }

  Future<BitmapDescriptor> getSvgMarker(
    BuildContext context,
    String svgPath,
  ) async {
    final rawSvg = await DefaultAssetBundle.of(context).loadString(svgPath);
    final pictureInfo = await vg.loadPicture(SvgStringLoader(rawSvg), null);

    final image = await pictureInfo.picture.toImage(48, 48);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.bytes(bytes!.buffer.asUint8List());
  }

  Future<bool> isLocationInCountry(LatLng location) async {
    try {
      final placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      if (placemarks.isNotEmpty) {
        final countryCode = placemarks.first.isoCountryCode ?? '';
        return countryCode == widget.countryCode;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: S.of(context).pickALocation,
      ),
      body: _customMarker == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(
                  height: 77.h,
                  width: double.infinity,
                  child: GoogleMap(
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: _pickedLocation ??
                          const LatLng(
                            37.7749,
                            -122.4194,
                          ), // Default position if no initial location
                      zoom: 15,
                    ),
                    onTap: (location) async {
                      if (await isLocationInCountry(location)) {
                        setState(() {
                          _pickedLocation = location;
                        });
                      } else {
                        SnackX.showSnackBar(
                          message: S
                              // ignore: use_build_context_synchronously
                              .of(context)
                              .thisLocationIsOutsideTheChosenCountry,
                        );
                      }
                    },
                    markers: _pickedLocation == null
                        ? <Marker>{}
                        : {
                            Marker(
                              markerId: const MarkerId('picked-location'),
                              position: _pickedLocation!,
                              icon: _customMarker!,
                            ),
                          },
                  ),
                ),
                CustomPadding(
                  child: CustomButton(
                    onPressed: () {
                      if (_pickedLocation != null) {
                        Navigator.pop(context, _pickedLocation);
                      }
                    },
                    buttonText: S.of(context).saveLocation,
                  ),
                ),
              ],
            ),
    );
  }
}
