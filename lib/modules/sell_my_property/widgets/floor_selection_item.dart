import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// FloorSelectionItem
class FloorSelectionItem extends StatelessWidget {
  /// Constructor
  FloorSelectionItem({
    required this.selectedFloor,
    required this.onFloorSelected,
    super.key,
  });

  /// selectedFloor
  final String selectedFloor;

  /// onFloorSelected
  final ValueChanged<String> onFloorSelected;

  /// floors
  final List<String> floors = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => onFloorSelected('Ground'),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: selectedFloor == 'Ground'
                    ? Theme.of(context).primaryColor
                    : const Color(0XFFDBDBDB),
                borderRadius: BorderRadius.circular(12.5.sp),
              ),
              child: Center(
                child: Text(
                  'Ground',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 9.sp,
                        color: selectedFloor == 'Ground'
                            ? Theme.of(context).scaffoldBackgroundColor
                            : ThemeHelper.appColors.black,
                      ),
                ),
              ),
            ),
          ),
          SizedX.w5,
          Center(
            child: Text(
              '-',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: ThemeHelper.appColors.black,
                  ),
            ),
          ),
          SizedX.w5,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                right: 4.w,
                left: 6.5.w,
                top: 0.5.h,
                bottom: 0.5.h,
              ),
              decoration: BoxDecoration(
                color: selectedFloor != 'Ground'
                    ? Theme.of(context).primaryColor
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: selectedFloor == 'Ground'
                      ? const Color(0XFFF4F4F4)
                      : Theme.of(context).primaryColor,
                  value: selectedFloor == 'Ground' ? floors[0] : selectedFloor,
                  items: floors.map((String floor) {
                    return DropdownMenuItem<String>(
                      value: floor,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: floor.substring(0, floor.length - 2),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: selectedFloor == 'Ground'
                                        ? ThemeHelper.appColors.black
                                        : Theme.of(context)
                                            .scaffoldBackgroundColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0,
                                  ),
                            ),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(1, -7),
                                child: Text(
                                  floor.substring(floor.length - 2),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: selectedFloor == 'Ground'
                                            ? ThemeHelper.appColors.black
                                            : Theme.of(context)
                                                .scaffoldBackgroundColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      onFloorSelected(newValue);
                    }
                  },
                  icon: Transform.rotate(
                    angle: 1.5708,
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: selectedFloor == 'Ground'
                          ? ThemeHelper.appColors.black
                          : Theme.of(context).scaffoldBackgroundColor,
                      size: 24.sp,
                    ),
                  ),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: selectedFloor == 'Ground'
                            ? ThemeHelper.appColors.black
                            : Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                      ),
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
