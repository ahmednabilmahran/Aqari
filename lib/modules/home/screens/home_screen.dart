import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/aqari_app_bar.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_search_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

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
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            width: 13.w,
                            padding: EdgeInsets.symmetric(vertical: 1.8.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(
                                    0,
                                    3,
                                  ),
                                ),
                              ],
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                Assets.genIconsFilter,
                                height: 2.7.h,
                                width: 2.7.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
