import 'package:aqari/apis/chat_api.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/excel_sheets_handler.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/utils/thousands_separator_input_formatter.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/sell_my_property/controllers/unit_details/unit_details_cubit.dart';
import 'package:aqari/modules/sell_my_property/widgets/cancel_button.dart';
import 'package:aqari/modules/sell_my_property/widgets/custom_price_gauge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

/// [UnitPriceDetailsScreen] class
class UnitPriceDetailsScreen extends StatefulWidget {
  /// Constructor
  const UnitPriceDetailsScreen({required this.unitDetailsCubit, super.key});

  /// Unit Details Cubit
  final UnitDetailsCubit unitDetailsCubit;

  @override
  // ignore: library_private_types_in_public_api
  _UnitPriceDetailsScreenState createState() => _UnitPriceDetailsScreenState();
}

class _UnitPriceDetailsScreenState extends State<UnitPriceDetailsScreen> {
  double _gaugeValue = 0;
  String _gaugeIcon = Assets.genIconsVeryLowGauge;
  String _gaugeLabel = '';

  @override
  void initState() {
    super.initState();
    _getRecommendedPrice();
  }

  /// Generate Unit Details Prompt
  String generateUnitDetailsPrompt(UnitDetailsState state) {
    final prompt = StringBuffer()
      ..writeln('Here are the unit details:')
      ..writeln('Category: ${state.selectedCategory}')
      ..writeln('Title: ${state.titleController.text}')
      ..writeln('Area: ${state.areaController.text}')
      ..writeln('Bedrooms: ${state.bedroomCount}')
      ..writeln('Bathrooms: ${state.bathroomCount}')
      ..writeln('Balconies: ${state.balconyCount}')
      ..writeln('Floor: ${state.selectedFloor}')
      ..writeln("Facilities: ${state.selectedFacilities.join(', ')}")
      ..writeln('Address Line 1: ${state.addressLine1Controller.text}')
      ..writeln('Address Line 2: ${state.addressLine2Controller.text}')
      ..writeln('City: ${state.cityController.text}')
      ..writeln('Country: ${state.selectedCountry.name}');
    if (state.selectedLocation != null) {
      prompt.writeln(
        // ignore: lines_longer_than_80_chars
        'Location: ${state.selectedLocation!.latitude}, ${state.selectedLocation!.longitude}',
      );
    }

    return prompt.toString();
  }

  /// Get Recommended Price
  Future<void> _getRecommendedPrice() async {
    final cubit = widget.unitDetailsCubit..setLoading(loading: true);
    try {
      final unitDetailsPrompt = generateUnitDetailsPrompt(cubit.state);
      final referenceData = await ExcelSheetsHandler.readExcelData(
        'assets/data/ministry_buildings.xls',
      );
      final recommendedPrice = await ChatApi().getRecommendedPrice(
        unitDetailsPrompt,
        referenceData,
      );
      cubit.state.recommendedPriceController.text =
          NumberFormat.decimalPattern().format(recommendedPrice);
      _updateGauge();
    } catch (e) {
      SnackX.showSnackBar(message: 'Failed to get recommended price: $e');
    } finally {
      cubit.setLoading(loading: false);
    }
  }

  /// Update Gauge
  void _updateGauge() {
    final cubit = widget.unitDetailsCubit;
    final sellPrice = double.tryParse(
          cubit.state.sellPriceController.text.replaceAll(',', ''),
        ) ??
        0;
    final recommendedPrice = double.tryParse(
          cubit.state.recommendedPriceController.text.replaceAll(',', ''),
        ) ??
        0;

    setState(() {
      _gaugeValue = getGaugeValue(sellPrice, recommendedPrice);
      _gaugeIcon = getGaugeIcon(_gaugeValue);
      _gaugeLabel = getGaugeLabel(_gaugeValue);
    });
  }

  /// Get Gauge Icon
  String getGaugeIcon(double gaugeValue) {
    if (gaugeValue < -20) return Assets.genIconsVeryLowGauge;
    if (gaugeValue >= -20 && gaugeValue < -5) {
      return Assets.genIconsALittleBitLowGauge;
    }
    if (gaugeValue >= -5 && gaugeValue <= 5) return Assets.genIconsVeryGood;
    if (gaugeValue > 5 && gaugeValue <= 20) {
      return Assets.genIconsALittleBitHighGauge;
    }
    return Assets.genIconsVeryHighGauge;
  }

  double getGaugeValue(double sellPrice, double recommendedPrice) {
    final difference = (sellPrice - recommendedPrice) / recommendedPrice * 100;
    return difference;
  }

  String getGaugeLabel(double gaugeValue) {
    if (gaugeValue < -20) return S.of(context).veryLow;
    if (gaugeValue >= -20 && gaugeValue < -5) {
      return S.of(context).aLittleBitLow;
    }
    if (gaugeValue >= -5 && gaugeValue <= 5) return S.of(context).veryGood;
    if (gaugeValue > 5 && gaugeValue <= 20) return S.of(context).aLittleBitHigh;
    return S.of(context).veryHigh;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.unitDetailsCubit,
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
                          Text(
                            S.of(context).almostFinishedCompleteTheListing,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                            maxLines: 3,
                          ),
                          SizedX.h3,
                          CustomTextField(
                            controller: state.sellPriceController,
                            contentPaddingVertical: 1.75.h,
                            hintText: S.of(context).ex100000,
                            label: S.of(context).sellPrice,
                            labelTextStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                            suffixWidget: Text(
                              S.of(context).egp,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ThemeHelper.appColors.black,
                                    letterSpacing: 0,
                                  ),
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
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              ThousandsSeparatorInputFormatter(),
                            ],
                            onChanged: (value) {
                              _updateGauge();
                              return null;
                            },
                          ),
                          SizedX.h2,
                          Text(
                            S.of(context).aqarisRecommendedPrice,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ThemeHelper.appColors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                          ),
                          Text(
                            S
                                .of(context)
                                // ignore: lines_longer_than_80_chars
                                .automaticallyGeneratedPriceBasedOnYourUnitsSpecificationsUsingAn,
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
                          SizedX.h1,
                          if (state.isLoading) SizedX.h2 else const SizedBox(),
                          if (state.isLoading)
                            const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          else
                            CustomTextField(
                              controller: state.recommendedPriceController,
                              contentPaddingVertical: 1.75.h,
                              hintText: S.of(context).ex100000,
                              enabled: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: ThemeHelper.appColors.black
                                        .withOpacity(0.5),
                                  ),
                              suffixWidget: Text(
                                S.of(context).egp,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: ThemeHelper.appColors.black
                                          .withOpacity(0.5),
                                      letterSpacing: 0,
                                    ),
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
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                ThousandsSeparatorInputFormatter(),
                              ],
                            ),
                          SizedX.h2,
                          if (state.isLoading)
                            const SizedBox()
                          else
                            CustomPriceGauge(
                              gaugeIcon: _gaugeIcon,
                              gaugeLabel: _gaugeLabel,
                            ),
                          SizedX.h12,
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
              totalSteps: 4,
              currentStep: 3,
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
                        onPressed: () {},
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
