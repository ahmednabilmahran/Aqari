import 'package:aqari/apis/unit_images_api.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/models/unit_image_model.dart';
import 'package:aqari/models/unit_model.dart';
import 'package:aqari/modules/property_details/widget/custom_container_details_property.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// PropertyDetails widget to manage the property details
class PropertyDetails extends StatelessWidget {
  /// Constructor
  const PropertyDetails({
    required this.unit,
    super.key,
  });

  /// The unit data
  final UnitModel unit;

  Future<List<UnitImageModel>> _fetchUnitImages(int unitId) async {
    final service = UnitImagesApi();
    return service.fetchUnitImages(unitId);
  }

  @override
  Widget build(BuildContext context) {
    final unitProperties = [
      CustomContainerDetailsProperty(
        image: Assets.genIconsArea,
        title: unit.areaMeter.toString(),
        subTitle: 'M2',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsBed,
        title: unit.bedrooms.toString(),
        subTitle: 'Bedrooms',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsBathtub,
        title: unit.bathrooms.toString(),
        subTitle: 'Bathrooms',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsSteair,
        title: unit.floor,
        subTitle: 'Floors',
      ),
    ];

    const facilities = [
      CustomContainerDetailsProperty(
        image: Assets.genIconsCar,
        subTitle: 'car',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsSwim,
        subTitle: 'swimming',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsExercise,
        subTitle: 'Gym & Fit',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsRestaurant,
        subTitle: 'resturant',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsWifi,
        subTitle: 'Wi-Fi',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsPets,
        subTitle: 'pet center',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsRunning,
        subTitle: 'Running',
      ),
      CustomContainerDetailsProperty(
        image: Assets.genIconsLaundry,
        subTitle: 'laundry',
      ),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(unit.mainImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 4.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.sp),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: ThemeHelper.appColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 4.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.sp),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                color: ThemeHelper.appColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  unit.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  '${unit.address}, ${unit.city}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    unit.type,
                    style: TextStyle(
                      color: ThemeHelper.appColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              TabBar(
                labelStyle: TextStyle(
                  color: ThemeHelper.appColors.primaryColor,
                  fontSize: 16,
                ),
                dividerColor: ThemeHelper.appColors.primaryColor,
                indicatorColor: ThemeHelper.appColors.primaryColor,
                tabs: const [
                  Tab(text: 'Description'),
                  Tab(text: 'Gallery'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (ctx, _) =>
                                  const SizedBox(width: 8),
                              itemCount: unitProperties.length,
                              itemBuilder: (ctx, i) => unitProperties[i],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Facilities',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  // ignore: lines_longer_than_80_chars
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 4,
                                childAspectRatio: 1.5,
                                mainAxisExtent: 100,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: facilities.length,
                              itemBuilder: (ctx, i) => facilities[i],
                            ),
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60),
                            ),
                            child: Card(
                              elevation: 4,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                      width: double.infinity,
                                    ),
                                    const Text(
                                      'Interested in buying this unit?',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomButton(
                                      onPressed: () {},
                                      buttonText: 'Chat With Us',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomButton(
                                      onPressed: () {},
                                      buttonText: 'Call Us',
                                      fillBackgroundColor: Colors.white54,
                                      fillTextColor: Colors.black,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<List<UnitImageModel>>(
                      future: _fetchUnitImages(unit.unitId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          final imageUrls = snapshot.data ?? [];
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(
                                    'Gallery(${imageUrls.length})',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 300,
                                    width: MediaQuery.of(context).size.width,
                                    child: GridView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          // ignore: lines_longer_than_80_chars
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 4,
                                      ),
                                      itemCount: imageUrls.length,
                                      itemBuilder: (ctx, i) =>
                                          CachedNetworkImage(
                                        imageUrl: imageUrls[i].imageUrl,
                                        memCacheHeight: 300,
                                        memCacheWidth: 300,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(60),
                                      topRight: Radius.circular(60),
                                    ),
                                    child: Card(
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 30,
                                              width: double.infinity,
                                            ),
                                            const Text(
                                              'Interested in buying this unit?',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomButton(
                                              onPressed: () {},
                                              buttonText: 'Chat With Us',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomButton(
                                              onPressed: () {},
                                              buttonText: 'Call Us',
                                              fillBackgroundColor:
                                                  Colors.white54,
                                              fillTextColor: Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
