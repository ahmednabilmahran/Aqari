import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Cancel Button
class CancelButton extends StatelessWidget {
  /// Constructor
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: Align(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.sp),
              color: const Color(0XFF1B1B1B).withOpacity(0.05),
            ),
            child: Row(
              children: [
                SizedX.w3,
                SizedX.h4,
                Text(
                  S.of(context).cancel,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: ThemeHelper.appColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Icon(
                  Icons.close_rounded,
                  color: const Color(0XFFFF6363),
                  size: 20.sp,
                ),
                SizedX.w2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
