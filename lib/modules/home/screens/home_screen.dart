import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/aqari_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_filter.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_search_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/widgets/custom_card_property.dart';

/// HomeScreen
class HomeScreen extends StatelessWidget {
  /// Constructor
  HomeScreen({super.key});

  /// houses
  final List<House> houses = [
    House(image: Assets.genImagesTest1, location: 'Location 1'),
    House(image: Assets.genImagesTest2, location: 'Location 2'),
    House(image: Assets.genImagesTest3, location: 'Location 3'),
    House(image: Assets.genImagesTest4, location: 'Location 4'),
    House(image: Assets.genImagesTest5, location: 'Location 5'),
    House(image: Assets.genImagesTest6, location: 'Location 6'),
    House(image: Assets.genImagesTest7, location: 'Location 7'),
    House(image: Assets.genImagesTest8, location: 'Location 8'),
  ];

  @override
  Widget build(BuildContext context) {
    final circleDiameter = 15.w;

    return Scaffold(
      appBar: const AqariAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedX.h1,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: houses.asMap().entries.map(
                      (entry) {
                        return Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      entry.value.image,
                                      fit: BoxFit.cover,
                                      width: circleDiameter,
                                      height: circleDiameter,
                                    ),
                                  ),
                                ),
                                SizedX.h0p5,
                                SizedBox(
                                  width: circleDiameter,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      entry.value.location,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            fontSize: 7.sp,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedX.w2p5,
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
                SizedX.h3,
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchField(
                        controller: TextEditingController(),
                      ),
                    ),
                    SizedX.w3,
                    const CustomFilter(),
                  ],
                ),//CustomSearchField(),CustomFilter(),
                SizedX.h3,
                Container(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 1.w,
                    top: 1.5.h,
                    bottom: 1.5.h,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                S.of(context).sellMyProperty,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: ThemeHelper.appColors.black,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                S.of(context).listMyPropertyForSale,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w300,
                                      color: ThemeHelper.appColors.darkGrey,
                                      letterSpacing: 0,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedX.w2,
                      SvgPicture.asset(
                        Assets.genIconsForSale,
                        height: 9.h,
                        width: 9.w,
                      ),
                    ],
                  ),
                ),
                SizedX.h3,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).featuredProperties,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 16.sp,
                                    color: ThemeHelper.appColors.black,
                                  ),
                        ),
                        SizedX.h0p5,
                        Text(
                          S.of(context).checkOutSomeOfOurTopListings,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      buttonSize: Size(22.w, 4.1.h),
                      onPressed: () {},
                      buttonText: S.of(context).viewAll,
                      borderRadius: 6.sp,
                      labelText:
                          Theme.of(context).textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.sp,
                                color: Theme.of(context).dividerColor,
                              ),
                    ),
                  ],
                ),
                SizedX.h3,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: houses
                        .map(
                          (house) => Padding(
                            padding: EdgeInsets.only(
                              right: 4.w,
                            ),
                            child: HouseCard(
                              imagePath: house.image,
                              title: house.location,
                              details: '4 Beds | 3 Baths | 2500 sqft',
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedX.h3,
                Row(
                  children: [
                    Text(
                      S.of(context).nearYou,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16.sp,
                            color: ThemeHelper.appColors.black,
                          ),
                    ),
                    const Spacer(),
                    CustomButton(
                      buttonSize: Size(22.w, 4.1.h),
                      onPressed: () {},
                      buttonText: S.of(context).viewMore,
                      borderRadius: 6.sp,
                      labelText:
                          Theme.of(context).textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.sp,
                                color: Theme.of(context).dividerColor,
                              ),
                    ),
                  ],
                ),
                SizedX.h2,
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => const PropertyCard(),
                  separatorBuilder: (context, index) => SizedX.h2p5,
                  itemCount: 5,
                ),//Listview of  PropertyCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// House
class House {
  /// Constructor
  House({required this.image, required this.location});

  /// image
  final String image;

  /// location
  final String location;
}

/// HouseCard widget to display a house with details.
class HouseCard extends StatelessWidget {
  /// Constructor
  const HouseCard({
    required this.imagePath,
    required this.title,
    required this.details,
    super.key,
  });

  /// imagePath
  final String imagePath;

  /// title
  final String title;

  /// details
  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 0.1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 18.75.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                        color: ThemeHelper.appColors.black,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w300,
                        color: ThemeHelper.appColors.black,
                        letterSpacing: 0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// PropertyCard widget to display a property with details.
