import 'package:aqari/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// CustomFilterStaticSection
class CustomFilterStaticSection extends StatelessWidget {
  /// Constructor
  const CustomFilterStaticSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
