import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/modules/search/controllers/custom_filter/custom_filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// CustomRadio widget to display radio button.
class CustomRadio extends StatelessWidget {
  /// Constructor
  const CustomRadio({
    required this.context,
    required this.state,
    required this.value,
    super.key,
  });

  /// context
  final BuildContext context;

  /// state
  final CustomFilterState state;

  /// value
  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => context.read<CustomFilterCubit>().updatePropertyType(value),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.genIconsNonActiveRadio,
            colorFilter: ColorFilter.mode(
              value == state.propertyType
                  ? ThemeHelper.appColors.primaryColor
                  : const Color(0XFFDBDBDB),
              BlendMode.srcIn,
            ),
            width: 2.5.w,
            height: 2.5.h,
            clipBehavior: Clip.none,
          ),
          SizedX.w2,
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: const Color(0XFF262626),
                  fontWeight: FontWeight.w300,
                  fontSize: 10.75.sp,
                  letterSpacing: 0.5,
                ),
          ),
        ],
      ),
    );
  }
}
