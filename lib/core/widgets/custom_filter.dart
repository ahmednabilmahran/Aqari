import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../utils/assets.dart';
import '../utils/theme_helper.dart';

class CustomFilter extends StatefulWidget {
  const CustomFilter();

  @override
  State<CustomFilter> createState() => _CustomFilterState();
}

class _CustomFilterState extends State<CustomFilter> {
  _CustomFilterState({this.groupValue});

  String? groupValue;
  RangeValues values = const RangeValues(1000, 5000);
  SfRangeValues _rangeValues = const SfRangeValues(1000.0, 5000.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          showDragHandle: true,
          scrollControlDisabledMaxHeightRatio: 0.7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp)),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    'Filter',
                    style: TextStyle(
                      color: ThemeHelper.appColors.primaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  )), //text filter
                  Flexible(
                    child: Text(
                      'Property type',
                      style: TextStyle(
                        color: ThemeHelper.appColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ), //text property
                  SizedBox(
                    width: 100.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              listTileTheme: const ListTileThemeData(
                                horizontalTitleGap: 0,
                              ),
                            ),
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              activeColor: ThemeHelper.appColors.primaryColor,
                              title: const Text('House', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              value: 'House',
                              groupValue: groupValue,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              onChanged: (value) {
                                setState(
                                  () {
                                    groupValue = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ), //house
                        Expanded(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              listTileTheme: const ListTileThemeData(
                                horizontalTitleGap: 0,
                              ),
                            ),
                            child: RadioListTile(

                              contentPadding: EdgeInsets.zero,

                              activeColor: ThemeHelper.appColors.primaryColor,
                              title: const Text(
                                'Apartment',
                                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                              ),
                              value: 'Apartment',
                              groupValue: groupValue,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              onChanged: (value) {
                                setState(
                                  () {
                                    groupValue = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ), //apartment
                        Expanded(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              listTileTheme: const ListTileThemeData(
                                horizontalTitleGap: 0,
                              ),
                            ),
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              activeColor: ThemeHelper.appColors.primaryColor,
                              title: const Text('Flat', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              value: 'Flat',
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              groupValue: groupValue,
                              onChanged: (value) {
                                setState(
                                  () {
                                    groupValue = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ), //flat
                        Expanded(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              listTileTheme: const ListTileThemeData(
                                horizontalTitleGap: 0,
                              ),
                            ),
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              activeColor: ThemeHelper.appColors.primaryColor,
                              title: const Text('Villa', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              value: 'Villa',
                              groupValue: groupValue,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              onChanged: (value) {
                                setState(
                                  () {
                                    groupValue = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ), //villa
                      ],
                    ), //RadioListTiles
                  ), //RadioListTiles
                  SizedBox(
                    height: 2.h,
                  ),
                  Flexible(
                    child: Text(
                      'Area (sqft)',
                      style: TextStyle(
                        color: ThemeHelper.appColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ), //Area
                  SizedBox(
                    width: 100.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: TextEditingController(),
                            hintText: 'Minimum',
                            label: 'Minimum',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ), //Expanded TextFields minimum
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: TextEditingController(),
                            hintText: 'Maximum',
                            label: 'Maximum',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ), //Expanded TextFields maximum
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ), //Area filters
                  ),
                  SizedBox(height: 2.h),
                  Flexible(
                    child: Text(
                      'Price range',
                      style: TextStyle(
                        color: ThemeHelper.appColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ), //price range
                  SizedBox(
                    height: 2.h,
                  ),
                  Expanded(
                    child: SfRangeSlider(
                      min: 500,
                      max: 10000.0,
                      values: _rangeValues,
                      interval: 1000,
                      dragMode: SliderDragMode.both,
                      activeColor: ThemeHelper.appColors.primaryColor,
                      inactiveColor: Colors.grey.shade300,
                      enableTooltip: true,
                      onChanged: (SfRangeValues values) {
                        setState(() {
                          _rangeValues = values;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: CustomButton(
                          borderColor: ThemeHelper.appColors.black,
                          fillBackgroundColor: ThemeHelper.appColors.white,
                          labelText: TextStyle(
                              color: ThemeHelper.appColors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400),
                          buttonText: 'Reset',
                          onPressed: () {},
                        )),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                            child: CustomButton(
                          buttonText: 'Apply',
                          onPressed: () {},
                        )),
                      ],
                    ), //RadioListTiles
                  ), //Buttons apply and reset
                ],
              ),
            );
          },
        );
      },
      child: Row(
        children: [
          Container(
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
          ),
        ],
      ),
    );
  }
}
