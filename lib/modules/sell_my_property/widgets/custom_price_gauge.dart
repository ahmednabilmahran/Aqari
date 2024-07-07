import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

/// Custom Price Gauge
class CustomPriceGauge extends StatelessWidget {
  /// Constructor
  const CustomPriceGauge({
    required this.gaugeIcon,
    required this.gaugeLabel,
    super.key,
  });

  /// Gauge Icon
  final String gaugeIcon;

  /// Gauge Label
  final String gaugeLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0XFFDBDBDB).withOpacity(0.1),
        borderRadius: BorderRadius.circular(13.sp),
        border: Border.all(
          color: const Color(0XFFD0D5DD).withOpacity(0.5),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
      ),
      child: CustomPadding(
        child: IntrinsicHeight(
          child: Row(
            children: [
              SvgPicture.asset(
                gaugeIcon,
                height: 6.5.h,
                width: 6.5.w,
              ),
              SizedX.w2,
              VerticalDivider(
                color: ThemeHelper.appColors.black.withOpacity(0.15),
                thickness: 1,
              ),
              SizedX.w2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).yourPriceIs,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ThemeHelper.appColors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                          height: 0,
                        ),
                  ),
                  Text(
                    gaugeLabel,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ThemeHelper.appColors.black,
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
