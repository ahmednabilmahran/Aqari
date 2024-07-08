import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../generated/l10n.dart';
import 'custom_button.dart';

/// PropertyCard is used to manage the property card
class PropertyCard extends StatelessWidget {
  /// Constructor
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.h,
      padding: EdgeInsets.symmetric(vertical: 1.25.h, horizontal: 2.75.w),
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        borderRadius: BorderRadius.circular(10.sp),
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
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      Assets.genImagesTest1,
                      height: double.infinity,
                      width: 23.5.w,
                      fit: BoxFit.cover,
                    ),
                    //icon favorite is added here but it in comment in the same file botom

                  ],
                ),
              ),
            ],
          ),
          SizedX.w2,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.55.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Woodland Apartment',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: ThemeHelper.appColors.black,
                        ),
                  ),
                  SizedX.h0p5,
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.genIconsLocationPin,
                        height: 1.6.h,
                        width: 1.6.w,
                      ),
                      SizedX.w1,
                      Text(
                        'New Cairo',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w300,
                              color: ThemeHelper.appColors.darkGrey,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.genIconsSquareFt,
                        height: 1.5.h,
                        width: 1.5.w,
                      ),
                      SizedX.w1,
                      Text(
                        '1,225',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 8.5.sp,
                              fontWeight: FontWeight.w500,
                              color: ThemeHelper.appColors.darkGrey,
                            ),
                      ),
                      SizedX.w4,
                      SvgPicture.asset(
                        Assets.genIconsRooms,
                        height: 1.5.h,
                        width: 1.5.w,
                      ),
                      SizedX.w1,
                      Text(
                        '3.0',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 8.5.sp,
                              fontWeight: FontWeight.w500,
                              color: ThemeHelper.appColors.darkGrey,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/* Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 30.sp,
                        width: 30.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300.sp),
                          color: Colors.white,

                        ),
                        child: IconButton(
                          onPressed: () {}, *//* {
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Remove Property',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedX.h2,
                                      const PropertyCard(),
                                      SizedX.h2,
                                      CustomButton(
                                        buttonText: 'Yes, Remove',
                                        onPressed: () {
                                        },
                                      ),
                                      SizedX.h2,
                                      CustomButton(
                                        buttonText: 'No, Cancel',
                                        fillTextColor: Colors.black,
                                        fillBackgroundColor: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      SizedX.h2,
                                    ],
                                  ),
                                );
                              },
                            );
                          },*//*
                          icon: Icon(
                            Icons.favorite,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),*/