import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// [AiOptionCard]
class AiOptionCard extends StatelessWidget {
  /// [AiOptionCard] constructor
  const AiOptionCard({
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
    super.key,
  });

  /// title
  final String title;

  /// description
  final String description;

  /// image
  final String image;

  /// onTap
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.sp),
          border: Border.all(
            color: Colors.black.withOpacity(0.15),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB5854B).withOpacity(0.15),
              offset: const Offset(0, 10),
              blurRadius: 23,
            ),
            BoxShadow(
              color: const Color(0xFFB5854B).withOpacity(0.13),
              offset: const Offset(0, 41),
              blurRadius: 41,
            ),
            BoxShadow(
              color: const Color(0xFFB5854B).withOpacity(0.08),
              offset: const Offset(0, 92),
              blurRadius: 55,
            ),
            BoxShadow(
              color: const Color(0xFFB5854B).withOpacity(0.02),
              offset: const Offset(0, 164),
              blurRadius: 65,
            ),
            BoxShadow(
              color: const Color(0xFFB5854B).withOpacity(0.0),
              offset: const Offset(0, 256),
              blurRadius: 72,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 2.25.h,
            left: 3.w,
            bottom: 2.25.h,
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Text(
                      S.of(context).ai,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: ThemeHelper.appColors.black,
                                letterSpacing: 0,
                                height: 0.8,
                                fontSize: 38.sp,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    FittedBox(
                      child: Text(
                        title,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: ThemeHelper.appColors.black,
                                  letterSpacing: 0,
                                  fontSize: 38.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    SizedX.h0p5,
                    Text(
                      description,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: const Color(0XFF737373),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Image.asset(
                image,
                height: 45.w,
                width: 45.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
