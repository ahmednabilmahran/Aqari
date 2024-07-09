import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_card_property.dart';
import 'package:aqari/models/unit_model.dart';
import 'package:aqari/modules/property_details/property_details.dart';
import 'package:flutter/material.dart';

/// ExploreMoreUnitsScreen is used to manage the favorites screen
class ExploreMoreUnitsScreen extends StatelessWidget {
  /// Constructor
  const ExploreMoreUnitsScreen({required this.units, super.key});

  /// Units
  final List<UnitModel> units;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Explore More'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedX.h1,
              Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final unit = units[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => PropertyDetails(
                                unit: unit,
                              ),
                            ),
                          );
                        },
                        child: PropertyCard(
                          imagePath: unit.mainImageUrl,
                          title: unit.title,
                          location: unit.city,
                          area: unit.areaMeter.toString(),
                          bedrooms: unit.bedrooms.toString(),
                          bathrooms: unit.bathrooms.toString(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedX.h2p5,
                    itemCount: units.length,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
