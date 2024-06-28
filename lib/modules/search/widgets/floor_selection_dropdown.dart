import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/search/controllers/custom_filter/custom_filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// FloorSelectionDropdown
class FloorSelectionDropdown extends StatelessWidget {
  /// Constructor
  const FloorSelectionDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CustomFilterCubit, CustomFilterState>(
          builder: (context, state) {
            return CustomDropdown.multiSelect(
              items: const [
                'Ground',
                '1st',
                '2nd',
                '3rd',
                '4th',
                '5th',
                '6th',
                '7th',
                '8th',
                '9th',
                '10th',
              ],
              initialItems: state.selectedFloors,
              overlayHeight: 30.h,
              hintText: S.of(context).selectFloor,
              hintBuilder: (context, hint, enabled) => Text(
                hint,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp,
                      color: ThemeHelper.appColors.black,
                    ),
              ),
              headerListBuilder: (context, selectedItems, enabled) {
                return Text(
                  selectedItems.map((e) => e).join(', '),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 11.sp,
                        color: ThemeHelper.appColors.black,
                      ),
                );
              },
              listItemBuilder: (
                context,
                item,
                isSelected,
                onItemSelect,
              ) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    highlightColor: Colors.grey[200],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          item,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11.sp,
                                    color: ThemeHelper.appColors.black,
                                  ),
                        ),
                        onTap: () {
                          onItemSelect();
                          final newSelectedFloors = List<String>.from(
                            state.selectedFloors,
                          );
                          if (isSelected) {
                            newSelectedFloors.remove(item);
                          } else {
                            newSelectedFloors.add(item);
                          }
                          context
                              .read<CustomFilterCubit>()
                              .updateSelectedFloors(
                                newSelectedFloors,
                              );
                        },
                        splashColor: Colors.grey[200],
                      ),
                    ],
                  ),
                );
              },
              decoration: CustomDropdownDecoration(
                closedFillColor: Theme.of(context).scaffoldBackgroundColor,
                closedBorder: Border.all(
                  color: const Color(0XFFF4F4F4),
                ),
                listItemDecoration: ListItemDecoration(
                  selectedColor: const Color(0XFFF4F4F4),
                  splashColor: Colors.grey[200],
                  highlightColor: Colors.grey[200],
                ),
                closedBorderRadius: BorderRadius.circular(8.sp),
                closedErrorBorder: Border.all(
                  color: Theme.of(context).colorScheme.error,
                ),
                closedErrorBorderRadius: BorderRadius.circular(8.sp),
                expandedBorder: Border.all(
                  color: Theme.of(context).hoverColor,
                ),
                expandedBorderRadius: BorderRadius.circular(8.sp),
              ),
              onListChanged: (value) {},
            );
          },
        ),
      ],
    );
  }
}
