// ignore_for_file: lines_longer_than_80_chars

import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// Getting Started Screen
class GettingStartedScreen extends StatelessWidget {
  /// Constructor
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: '',
      ),
      backgroundColor: Theme.of(context).splashColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.5.w, vertical: 1.h),
              child: Text(
                'It’s easy to list your unit on Aqari!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ThemeHelper.appColors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                    ),
              ),
            ),
            SizedX.h3,
            Padding(
              padding: EdgeInsets.only(
                left: 6.5.w,
                right: 6.w,
                top: 1.h,
                bottom: 1.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: ThemeHelper.appColors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                  ),
                  SizedX.w5,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            'Add your property details',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                            maxLines: 1,
                          ),
                        ),
                        SizedX.h0p25,
                        Text(
                          'Share some basic info, like where it is and its area and floor ...etc',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: ThemeHelper.appColors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0,
                                  ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  SizedX.w5,
                  SvgPicture.asset(
                    Assets.genIconsAddYourPropertyDetails,
                    width: 7.25.w,
                    height: 7.25.h,
                  ),
                ],
              ),
            ),
            SizedX.h2,
            Divider(
              color: ThemeHelper.appColors.black.withOpacity(0.15),
              thickness: 1,
            ),
            SizedX.h2,
            Padding(
              padding: EdgeInsets.only(
                left: 6.5.w,
                right: 6.w,
                top: 1.h,
                bottom: 1.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: ThemeHelper.appColors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                  ),
                  SizedX.w5,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            'Make it stand out',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                            maxLines: 1,
                          ),
                        ),
                        SizedX.h0p25,
                        Text(
                          'Add 5 or more high-quality photos to show the facilities of the unit',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: ThemeHelper.appColors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0,
                                  ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  SizedX.w5,
                  SvgPicture.asset(
                    Assets.genIconsMakeItStandOut,
                    width: 7.25.w,
                    height: 7.25.h,
                  ),
                ],
              ),
            ),
            SizedX.h2,
            Divider(
              color: ThemeHelper.appColors.black.withOpacity(0.15),
              thickness: 1,
            ),
            SizedX.h2,
            Padding(
              padding: EdgeInsets.only(
                left: 6.5.w,
                right: 6.w,
                top: 1.h,
                bottom: 1.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: ThemeHelper.appColors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                  ),
                  SizedX.w5,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            'Finish up and publish',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                            maxLines: 1,
                          ),
                        ),
                        SizedX.h0p25,
                        Text(
                          'We review your request to list the unit for sale on our platform. Upon completion, you will receive an approval notification.',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: ThemeHelper.appColors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0,
                                  ),
                          maxLines: 6,
                        ),
                      ],
                    ),
                  ),
                  SizedX.w5,
                  SvgPicture.asset(
                    Assets.genIconsFinishUpAndPublish,
                    width: 7.25.w,
                    height: 7.25.h,
                  ),
                ],
              ),
            ),
            SizedX.h2,
            Divider(
              color: ThemeHelper.appColors.black.withOpacity(0.15),
              thickness: 1,
            ),
            SizedX.h2,
            Padding(
              padding: EdgeInsets.only(
                left: 6.5.w,
                right: 6.w,
                top: 1.h,
                bottom: 1.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: ThemeHelper.appColors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                  ),
                  SizedX.w5,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            'All set',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                            maxLines: 1,
                          ),
                        ),
                        SizedX.h0p25,
                        Text(
                          'Your unit is now listed on Aqari, awaiting a buyer.',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: ThemeHelper.appColors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0,
                                  ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  SizedX.w5,
                  SvgPicture.asset(
                    Assets.genIconsAllSet,
                    width: 7.25.w,
                    height: 7.25.h,
                  ),
                ],
              ),
            ),
            SizedX.h8,
            SizedX.h8,
          ],
        ),
      ),
      bottomSheet: CustomPadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(onPressed: () {}, buttonText: 'Get Started'),
            SizedX.h5,
          ],
        ),
      ),
    );
  }
}
