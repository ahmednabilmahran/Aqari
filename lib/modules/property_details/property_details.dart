import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/modules/property_details/widget/custom_container_details_property.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// PropertyDetails widget to manage the property details
class PropertyDetails extends StatelessWidget {
  /// PropertyDetails widget to manage the property details
  PropertyDetails({super.key});

  /// PropertyDetails widget to manage the property details
  final unitProperties = [
    const CustomContainerDetailsProperty(
      image: 'assets/gen/images/area.svg',
      title: '120',
      subTitle: 'M2',
    ),
    const CustomContainerDetailsProperty(
      image: 'assets/gen/images/bed.svg',
      title: '3',
      subTitle: 'Bedrooms',
    ),
    const CustomContainerDetailsProperty(
      image: 'assets/gen/images/bathtub.svg',
      title: '1',
      subTitle: 'Bathrooms',
    ),
    const CustomContainerDetailsProperty(
      image: 'assets/gen/images/steair.svg',
      title: '4',
      subTitle: 'Floors',
    ),
  ];
  // ignore: public_member_api_docs
  final facilities = const [
    CustomContainerDetailsProperty(
      image: 'assets/gen/images/car.svg',
      subTitle: 'car',
    ),
    CustomContainerDetailsProperty(
      image: 'assets/gen/images/swim.svg',
      subTitle: 'swimming',
    ),
    CustomContainerDetailsProperty(
      image: 'assets/gen/images/exercise.svg',
      subTitle: 'Gym & Fit',
    ),
    CustomContainerDetailsProperty(
      image: 'assets/gen/images/restaurant.svg',
      subTitle: 'resturant',
    ),
    CustomContainerDetailsProperty(
      image: 'assets/gen/images/wifi.svg',
      subTitle: 'Wi-Fi',
    ),
    CustomContainerDetailsProperty(
      image: 'assets/gen/images/pets.svg',
      subTitle: 'pet center',
    ),
    CustomContainerDetailsProperty(
      image: 'assets/gen/images/running.svg',
      subTitle: 'Running',
    ),
    CustomContainerDetailsProperty(
      image: 'assets/gen/images/laundry.svg',
      subTitle: 'laundry',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: double.infinity,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(Assets.genImagesTest1),
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
              title: const Text(
                'Woodland Apartment',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text(
                '5th Settlement, New Cairo',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  'Apartment',
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
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Text(
                            'Gallery(6)',
                            style: TextStyle(
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
                              itemCount: 6,
                              itemBuilder: (ctx, i) =>
                                  Image.asset('assets/gen/images/test1.jpeg'),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
