import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/search/controllers/custom_filter/custom_filter_cubit.dart';
import 'package:aqari/modules/search/controllers/search/search_cubit.dart';
import 'package:aqari/modules/search/widgets/custom_filter_radio_buttons.dart';
import 'package:aqari/modules/search/widgets/custom_filter_static_section.dart';
import 'package:aqari/modules/search/widgets/floor_selection_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// CustomFilter
class CustomFilter extends StatelessWidget {
  /// Constructor
  const CustomFilter({
    required this.filterCubit,
    required this.searchCubit,
    super.key,
  });

  /// filterCubit
  final CustomFilterCubit filterCubit;

  /// searchCubit
  final SearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            filterCubit.loadAppliedFilters();
            showModalBottomSheet<void>(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.sp)),
              ),
              context: context,
              builder: (context) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: filterCubit,
                    ),
                    BlocProvider.value(
                      value: searchCubit,
                    ),
                  ],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedX.h1p5,
                      Container(
                        width: 18.w,
                        height: 0.6.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0XFFDBDBDB),
                        ),
                      ),
                      SizedX.h2,
                      Center(
                        child: Text(
                          S.of(context).filter,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                        ),
                      ),
                      SizedX.h1,
                      CustomPadding(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              S.of(context).propertyType,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: ThemeHelper.appColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                            ),
                            SizedX.h2,
                            const CustomFilterRadioButtons(),
                            SizedX.h3,
                            Text(
                              S.of(context).floor,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: ThemeHelper.appColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                            ),
                            SizedX.h2p5,
                            const FloorSelectionDropdown(),
                            SizedX.h4,
                            Text(
                              'Area (m²)',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: ThemeHelper.appColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                            ),
                            SizedX.h2p5,
                            Row(
                              children: [
                                Expanded(
                                  child: BlocBuilder<CustomFilterCubit,
                                      CustomFilterState>(
                                    builder: (context, state) {
                                      return CustomTextField(
                                        controller:
                                            filterCubit.minAreaController,
                                        contentPaddingVertical: 1.75.h,
                                        hintText: S.of(context).minimum,
                                        fillColor: const Color(0XFFF4F4F4),
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 11.sp,
                                              color:
                                                  ThemeHelper.appColors.black,
                                            ),
                                        useBorder: false,
                                        onChanged: (value) {
                                          filterCubit.updateMinArea(value);
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                SizedX.w5,
                                Expanded(
                                  child: BlocBuilder<CustomFilterCubit,
                                      CustomFilterState>(
                                    builder: (context, state) {
                                      return CustomTextField(
                                        controller:
                                            filterCubit.maxAreaController,
                                        contentPaddingVertical: 1.75.h,
                                        hintText: S.of(context).maximum,
                                        fillColor: const Color(0XFFF4F4F4),
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 11.sp,
                                              color:
                                                  ThemeHelper.appColors.black,
                                            ),
                                        useBorder: false,
                                        onChanged: (value) {
                                          filterCubit.updateMaxArea(value);
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedX.h4,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    buttonSize: Size(double.infinity, 7.h),
                                    borderColor: ThemeHelper.appColors.black,
                                    fillBackgroundColor:
                                        ThemeHelper.appColors.white,
                                    labelText: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: ThemeHelper.appColors.black,
                                        ),
                                    buttonText: S.of(context).reset,
                                    onPressed: () async {
                                      filterCubit.resetFilters();
                                      final filterState = filterCubit.state;
                                      await searchCubit.searchUnits(
                                        searchCubit.searchController.text,
                                        filterState,
                                      );
                                      Navigator.pop(
                                        // ignore: use_build_context_synchronously
                                        context,
                                      );
                                    },
                                  ),
                                ),
                                SizedX.w5,
                                Expanded(
                                  child: CustomButton(
                                    buttonSize: Size(double.infinity, 7.h),
                                    buttonText: S.of(context).apply,
                                    labelText: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: Theme.of(context).dividerColor,
                                        ),
                                    onPressed: () {
                                      filterCubit.applyFilters();
                                      final filterState = filterCubit.state;
                                      searchCubit.searchUnits(
                                        searchCubit.searchController.text,
                                        filterState,
                                      );
                                      Navigator.pop(
                                        context,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedX.h6,
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const CustomFilterStaticSection(),
        );
      },
    );
  }
}
