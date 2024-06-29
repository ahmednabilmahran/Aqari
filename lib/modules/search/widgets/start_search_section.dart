import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// StartSearchSection
class StartSearchSection extends StatelessWidget {
  /// constructor
  const StartSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 0.4.h,
      child: Column(
        children: [
          SvgPicture.asset(Assets.genIconsStartSearch),
          SizedX.h1,
          Text(
            S.of(context).initiatePropertySearch,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: ThemeHelper.appColors.black,
                ),
          ),
        ],
      ),
    );
  }
}
