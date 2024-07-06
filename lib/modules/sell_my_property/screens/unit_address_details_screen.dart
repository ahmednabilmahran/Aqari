import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/models/aqari_country_model.dart';
import 'package:aqari/modules/sell_my_property/controllers/unit_details/unit_details_cubit.dart';
import 'package:aqari/modules/sell_my_property/widgets/cancel_button.dart';
import 'package:aqari/modules/sell_my_property/widgets/map_selection_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

/// Unit Address Details Screen
class UnitAddressDetailsScreen extends StatelessWidget {
  /// Constructor
  const UnitAddressDetailsScreen({required this.unitDetailsCubit, super.key});

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
            Expanded(
              child: SingleChildScrollView(
                child: CustomPadding(
                  child: BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              S.of(context).whereIsTheLocation,
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
                          SizedX.h3,
                          CustomTextField(
                            controller: state.addressLine1Controller,
                            contentPaddingVertical: 1.75.h,
                            hintText: S.of(context).ex28AhmedKasemGodaSt,
                            label: S.of(context).addressLine1,
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
                                  fontSize: 10.sp,
                                  color: ThemeHelper.appColors.black,
                                ),
                          ),
                          SizedX.h2p5,
                          CustomTextField(
                            controller: state.addressLine2Controller,
                            contentPaddingVertical: 1.75.h,
                            hintText: S.of(context).exFromAbbasElAkadSt,
                            label: S.of(context).addressLine2,
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
                                  fontSize: 10.sp,
                                  color: ThemeHelper.appColors.black,
                                ),
                          ),
                          SizedX.h2p5,
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).country,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color:
                                                  ThemeHelper.appColors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.5,
                                            ),
                                      ),
                                      SizedX.h1,
                                      Container(
                                        padding: EdgeInsets.only(
                                          right: 2.w,
                                          left: 3.5.w,
                                          top: 0.4.h,
                                          bottom: 0.3.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0XFFF4F4F4),
                                          borderRadius:
                                              BorderRadius.circular(13.sp),
                                          border: Border.all(
                                            color: Theme.of(context).hoverColor,
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child:
                                              DropdownButton<AqariCountryModel>(
                                            borderRadius:
                                                BorderRadius.circular(13.sp),
                                            dropdownColor:
                                                const Color(0XFFF4F4F4),
                                            value: state.selectedCountry,
                                            items:
                                                state.countries.map((country) {
                                              return DropdownMenuItem<
                                                  AqariCountryModel>(
                                                value: country,
                                                child: Text(
                                                  country.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 11.sp,
                                                        color: ThemeHelper
                                                            .appColors.black,
                                                        letterSpacing: 0,
                                                      ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (country) {
                                              context
                                                  .read<UnitDetailsCubit>()
                                                  .selectCountry(country!);
                                            },
                                            icon: Transform.rotate(
                                              angle: 1.5708,
                                              child: Icon(
                                                Icons.chevron_right_rounded,
                                                color:
                                                    ThemeHelper.appColors.black,
                                                size: 20.sp,
                                              ),
                                            ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: ThemeHelper
                                                      .appColors.black,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0,
                                                ),
                                            isExpanded: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedX.w4,
                                Expanded(
                                  child: CustomTextField(
                                    controller: state.cityController,
                                    contentPaddingVertical: 1.75.h,
                                    hintText: S.of(context).exCairo,
                                    label: S.of(context).city,
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
                                          fontSize: 10.sp,
                                          color: ThemeHelper.appColors.black,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedX.h3,
                          const MapSelectionSection(),
                          SizedX.h12,
                          // SizedX.h3,
                        ],
                      );
                    },
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
                      Navigator.pop(context);
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
                              .validateAddressInputs()) {
                            // Navigator.pushNamed(
                            //   context,
                            //   Routes.unitAddressDetails,
                            //   arguments: context.read<UnitDetailsCubit>(),
                            // );
                          } else {
                            // Show error message
                            SnackX.showSnackBar(
                              message: S.of(context).pleaseFillAllTheFields,
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
}
