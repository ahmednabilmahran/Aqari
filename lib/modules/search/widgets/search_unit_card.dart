import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// SearchUnitCard widget to display a unit with details.
class SearchUnitCard extends StatelessWidget {
  /// Constructor
  const SearchUnitCard({
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
        borderRadius: BorderRadius.circular(10.sp),
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
            height: 14.75.h,
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
                        color: const Color(0XFF2F2F2F),
                      ),
                ),
                SizedX.h0p25,
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.genIconsSquareFt,
                      height: 1.2.h,
                      width: 1.2.w,
                    ),
                    SizedX.w1,
                    Text(
                      '113 m²',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 7.75.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeHelper.appColors.darkGrey,
                          ),
                    ),
                    SizedX.w4,
                    SvgPicture.asset(
                      Assets.genIconsRooms,
                      height: 1.2.h,
                      width: 1.2.w,
                    ),
                    SizedX.w1,
                    Text(
                      '3',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 7.75.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeHelper.appColors.darkGrey,
                          ),
                    ),
                  ],
                ),
                SizedX.h0p5,
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.genIconsOutlinedLocationPin,
                      height: 1.2.h,
                      width: 1.2.w,
                    ),
                    SizedX.w1,
                    Text(
                      'New Cairo',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w300,
                            color: ThemeHelper.appColors.darkGrey,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
