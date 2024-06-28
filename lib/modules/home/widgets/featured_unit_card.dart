import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// FeaturedUnitCard widget to display a unit with details.
class FeaturedUnitCard extends StatelessWidget {
  /// Constructor
  const FeaturedUnitCard({
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
      width: 62.5.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.sp),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
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
            padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeHelper.appColors.black,
                      ),
                ),
                SizedX.h0p5,
                Text(
                  details,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 8.5.sp,
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
