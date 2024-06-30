import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/sell_my_property/controllers/unit_details/unit_details_cubit.dart';
import 'package:aqari/modules/sell_my_property/widgets/cancel_button.dart';
import 'package:aqari/modules/sell_my_property/widgets/category_item.dart';
import 'package:aqari/modules/sell_my_property/widgets/facility_item.dart';
import 'package:aqari/modules/sell_my_property/widgets/floor_selection_item.dart';
import 'package:aqari/modules/sell_my_property/widgets/property_feature_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

/// Unit Details Screen
class UnitDetailsScreen extends StatelessWidget {
  /// Constructor
  UnitDetailsScreen({super.key});

  final List<String> _categories = [
    'House',
    'Commercial',
    'Flat',
    'Villa',
  ];

  final List<String> _facilities = [
    'Parking Lot',
    'Pet Allowed',
    'Garden',
    'Gym',
    'Park',
    'Home theatre',
    'Kid’s Friendly',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UnitDetailsCubit(),
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
            Expanded(
              child: SingleChildScrollView(
                child: CustomPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          S.of(context).fillDetailsOfYourUnit,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: ThemeHelper.appColors.black,
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0,
                                  ),
                          maxLines: 1,
                        ),
                      ),
                      SizedX.h3,
                      BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
                        builder: (context, state) {
                          return CustomTextField(
                            controller: state.titleController,
                            contentPaddingVertical: 1.75.h,
                            hintText: S.of(context).exApartmentZedEast,
                            label: S.of(context).title,
                            labelTextStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                            borderRadius: 13.sp,
                            fillColor: const Color(0XFFF4F4F4),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11.sp,
                                  color: ThemeHelper.appColors.black,
                                ),
                          );
                        },
                      ),
                      SizedX.h2p5,
                      Text(
                        S.of(context).propertyCategory,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                      ),
                      SizedX.h2,
                      BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
                        builder: (context, state) {
                          return Wrap(
                            spacing: 3.w,
                            runSpacing: 1.5.h,
                            children: _categories.map((category) {
                              final isSelected =
                                  state.selectedCategory == category;
                              return CategoryItem(
                                category: category,
                                isSelected: isSelected,
                                onTap: () {
                                  context
                                      .read<UnitDetailsCubit>()
                                      .selectCategory(category);
                                },
                              );
                            }).toList(),
                          );
                        },
                      ),
                      SizedX.h3,
                      Text(
                        S.of(context).propertyFeatures,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                      ),
                      SizedX.h2,
                      BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PropertyFeatureItem(
                                label: 'Bedroom',
                                count: state.bedroomCount,
                                onIncrement: () {
                                  context
                                      .read<UnitDetailsCubit>()
                                      .incrementBedroomCount();
                                },
                                onDecrement: () {
                                  context
                                      .read<UnitDetailsCubit>()
                                      .decrementBedroomCount();
                                },
                              ),
                              SizedX.h2,
                              PropertyFeatureItem(
                                label: 'Bathroom',
                                count: state.bathroomCount,
                                onIncrement: () {
                                  context
                                      .read<UnitDetailsCubit>()
                                      .incrementBathroomCount();
                                },
                                onDecrement: () {
                                  context
                                      .read<UnitDetailsCubit>()
                                      .decrementBathroomCount();
                                },
                              ),
                              SizedX.h2,
                              PropertyFeatureItem(
                                label: 'Balcony',
                                count: state.balconyCount,
                                onIncrement: () {
                                  context
                                      .read<UnitDetailsCubit>()
                                      .incrementBalconyCount();
                                },
                                onDecrement: () {
                                  context
                                      .read<UnitDetailsCubit>()
                                      .decrementBalconyCount();
                                },
                              ),
                              SizedX.h3,
                              Text(
                                S.of(context).floor,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: ThemeHelper.appColors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0,
                                    ),
                              ),
                              SizedX.h1,
                              BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
                                builder: (context, state) {
                                  return FloorSelectionItem(
                                    selectedFloor: state.selectedFloor,
                                    onFloorSelected: (floor) {
                                      context
                                          .read<UnitDetailsCubit>()
                                          .selectFloor(floor);
                                    },
                                  );
                                },
                              ),
                              SizedX.h4,
                              Text(
                                S.of(context).environmentFacilities,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: ThemeHelper.appColors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0,
                                    ),
                              ),
                              SizedX.h2,
                              BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
                                builder: (context, state) {
                                  return Wrap(
                                    spacing: 3.w,
                                    runSpacing: 1.5.h,
                                    children: _facilities.map((facility) {
                                      final isSelected = state
                                          .selectedFacilities
                                          .contains(facility);
                                      return FacilityItem(
                                        facility: facility,
                                        isSelected: isSelected,
                                        onTap: () {
                                          context
                                              .read<UnitDetailsCubit>()
                                              .toggleFacility(facility);
                                        },
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      SizedX.h12,
                      // SizedX.h3,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StepProgressIndicator(
              totalSteps: 3,
              currentStep: 1,
              size: 0.5.h,
              // padding: 1.5.w,
              selectedColor: ThemeHelper.appColors.black.withOpacity(0.45),
              unselectedColor: ThemeHelper.appColors.black.withOpacity(0.1),
              // roundedEdges: const Radius.circular(10),
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
                      'Back',
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
                  CustomButton(
                    buttonSize: Size(23.w, 5.25.h),
                    onPressed: () {},
                    buttonText: 'Next',
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
}
