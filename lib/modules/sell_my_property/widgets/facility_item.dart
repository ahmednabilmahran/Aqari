import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Facility Item
class FacilityItem extends StatelessWidget {
  /// Constructor
  const FacilityItem({
    required this.facility,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  /// Facility
  final String facility;

  /// Is Selected
  final bool isSelected;

  /// On Tap
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : const Color(0XFFF4F4F4),
          borderRadius: BorderRadius.circular(15.5.sp),
        ),
        child: Text(
          facility,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 9.sp,
                color: isSelected
                    ? Theme.of(context).scaffoldBackgroundColor
                    : ThemeHelper.appColors.black,
              ),
        ),
      ),
    );
  }
}
