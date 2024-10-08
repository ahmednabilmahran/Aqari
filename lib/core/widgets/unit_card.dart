import 'package:aqari/core/utils/theme_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// UnitCard widget to display a unit with details.
class UnitCard extends StatelessWidget {
  /// Constructor
  const UnitCard({
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
          CachedNetworkImage(
            filterQuality: FilterQuality.high,
            imageUrl: imagePath,
            height: 18.75.h,
            width: double.infinity,
            fit: BoxFit.cover,
            memCacheHeight: 300,
            memCacheWidth: 300,
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
