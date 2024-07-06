import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/sell_my_property/controllers/unit_details/unit_details_cubit.dart';
import 'package:aqari/modules/sell_my_property/screens/map_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

/// Map Selection Section
class MapSelectionSection extends StatelessWidget {
  /// Constructor
  const MapSelectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            final location = await Navigator.push(
              context,
              MaterialPageRoute<LatLng>(
                builder: (context) => MapPickerScreen(
                  initialLocation:
                      state.selectedLocation ?? state.selectedCountryCenter,
                  countryCode: state.selectedCountryCode,
                ),
              ),
            );

            if (location != null) {
              // ignore: use_build_context_synchronously
              BlocProvider.of<UnitDetailsCubit>(context).updateLocation(
                location.latitude,
                location.longitude,
              );
            }
          },
          child: Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              image: DecorationImage(
                image: state.selectedLocation == null
                    ? const AssetImage(Assets.genImagesMapPlaceholder)
                        as ImageProvider
                    : NetworkImage(state.selectedLocationMapUrl!)
                        as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Text(
                state.selectedLocation == null
                    ? S.of(context).selectOnTheMap
                    : S.of(context).changeTheLocation,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
