import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Category Item
class CategoryItem extends StatelessWidget {
  /// Constructor
  const CategoryItem({
    required this.category,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  /// Category
  final String category;

  /// Is Selected
  final bool isSelected;

  /// On Tap
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : const Color(0XFFF4F4F4),
          borderRadius: BorderRadius.circular(12.5.sp),
        ),
        child: Text(
          category,
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
