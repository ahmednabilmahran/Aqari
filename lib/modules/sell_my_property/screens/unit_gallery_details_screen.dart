import 'dart:io';

import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/sell_my_property/controllers/unit_details/unit_details_cubit.dart';
import 'package:aqari/modules/sell_my_property/widgets/cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

/// UnitGalleryDetailsScreen
class UnitGalleryDetailsScreen extends StatelessWidget {
  /// Constructor
  const UnitGalleryDetailsScreen({required this.unitDetailsCubit, super.key});

  /// UnitDetailsCubit
  final UnitDetailsCubit unitDetailsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: unitDetailsCubit,
      child: Scaffold(
        appBar: const CustomAppBar(
          titleText: '',
          leading: CancelButton(),
        ),
        backgroundColor: Theme.of(context).splashColor,
        body: Column(
          children: [
            Divider(
              color: ThemeHelper.appColors.black.withOpacity(0.1),
              thickness: 1,
            ),
            BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
              builder: (context, state) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: CustomPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              S.of(context).addPhotosToYourListing,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: ThemeHelper.appColors.black,
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0,
                                  ),
                              maxLines: 1,
                            ),
                          ),
                          Text(
                            S.of(context).addUpTo20PhotosMaximumSize5MbEach,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10.5.sp,
                                  color: ThemeHelper.appColors.black,
                                  letterSpacing: 0,
                                ),
                          ),
                          SizedX.h3,
                          _buildImageGrid(context, state),
                          SizedX.h12,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StepProgressIndicator(
              totalSteps: 4,
              currentStep: 2,
              size: 0.5.h,
              selectedColor: ThemeHelper.appColors.black.withOpacity(0.45),
              unselectedColor: ThemeHelper.appColors.black.withOpacity(0.1),
            ),
            SizedX.h0p25,
            CustomPadding(
              child: Row(
                children: [
                  SizedX.w3,
                  InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      S.of(context).back,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ThemeHelper.appColors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                  const Spacer(),
                  BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
                    builder: (context, state) {
                      return CustomButton(
                        buttonSize: Size(23.w, 5.25.h),
                        onPressed: () {
                          if (context
                              .read<UnitDetailsCubit>()
                              .validateGalleryInputs()) {
                            Navigator.pushNamed(
                              context,
                              Routes.unitPriceDetails,
                              arguments: context.read<UnitDetailsCubit>(),
                            );
                          } else {
                            // Show error message
                            SnackX.showSnackBar(
                              message: S.of(context).pleaseAddAtLeastOneImage,
                            );
                          }
                        },
                        buttonText: S.of(context).next,
                      );
                    },
                  ),
                  SizedX.w1,
                ],
              ),
            ),
            SizedX.h1p5,
          ],
        ),
      ),
    );
  }

  Widget _buildImageGrid(BuildContext context, UnitDetailsState state) {
    final images = state.images;

    return Column(
      children: [
        if (images.isNotEmpty) ...[
          _buildMainImage(context, images[0]),
          SizedX.h2,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length - 1 + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3.w,
              mainAxisSpacing: 1.25.h,
            ),
            itemBuilder: (context, index) {
              if (index == images.length - 1) {
                return _buildAddMoreButton(context);
              }
              return _buildImageItem(context, images[index + 1], index + 1);
            },
          ),
        ] else ...[
          Center(child: _buildAddMoreButton(context)),
        ],
      ],
    );
  }

  Widget _buildMainImage(BuildContext context, String imagePath) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 27.5.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0XFFDBDBDB),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13.sp),
            child: Image.file(
              File(imagePath),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(2.25.sp),
            child: InkWell(
              onTap: () {
                context.read<UnitDetailsCubit>().removeImage(0);
              },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 13.5.sp,
                child: Icon(
                  Icons.close,
                  size: 14.sp,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageItem(BuildContext context, String imagePath, int index) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 20.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0XFFDBDBDB),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13.sp),
            child: Image.file(
              File(imagePath),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(2.25.sp),
            child: InkWell(
              onTap: () {
                context.read<UnitDetailsCubit>().removeImage(index);
              },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 13.5.sp,
                child: Icon(
                  Icons.close,
                  size: 14.sp,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddMoreButton(BuildContext context) {
    return BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
      builder: (context, state) {
        return Center(
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              context.read<UnitDetailsCubit>().addImages();
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: state.images.isEmpty ? 15.h : 11.5.h,
                width: state.images.isEmpty ? double.infinity : 25.w,
                decoration: BoxDecoration(
                  color: const Color(0XFFDBDBDB),
                  borderRadius: BorderRadius.circular(17.sp),
                ),
                child: Center(
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: state.images.isEmpty ? 38.sp : 28.sp,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
