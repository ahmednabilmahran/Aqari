import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Property Feature Item
class PropertyFeatureItem extends StatelessWidget {
  /// Constructor
  const PropertyFeatureItem({
    required this.label,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  /// Label
  final String label;

  /// Count
  final int count;

  /// On Increment
  final VoidCallback onIncrement;

  /// On Decrement
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.75.h),
      decoration: BoxDecoration(
        color: const Color(0XFFF4F4F4),
        borderRadius: BorderRadius.circular(12.5.sp),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                  color: ThemeHelper.appColors.black,
                ),
          ),
          const Spacer(),
          Row(
            children: [
              InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: onDecrement,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.7.w,
                    vertical: 0.8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0XFF737373),
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: Icon(
                    Icons.remove_rounded,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    size: 14.sp,
                  ),
                ),
              ),
              SizedX.w5,
              Text(
                '$count',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: ThemeHelper.appColors.black,
                    ),
              ),
              SizedX.w5,
              InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: onIncrement,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.7.w,
                    vertical: 0.8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0XFF737373),
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    size: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
