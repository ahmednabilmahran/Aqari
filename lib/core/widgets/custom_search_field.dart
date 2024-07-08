// ignore_for_file: public_member_api_docs

import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// this class is the custom search field
class CustomSearchField extends StatelessWidget {
  /// constructor
  const CustomSearchField({
    required this.controller,
    super.key,
    this.hintText,
    this.focusNode,
    this.useBorder = true,
    this.borderRadius = 6,
    this.validator,
    this.onChanged,
    this.prefixWidget,
    this.inputFormatters,
    this.enabled = true,
    this.fillColor,
    this.style,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.labelTextStyle,
    this.onTapOutside,
    this.autofillHints,
    this.hintStyle,
    this.onFieldSubmitted,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? hintText;

  final Widget? prefixWidget;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool useBorder;
  final TextStyle? labelTextStyle;
  final double? borderRadius;
  final Color? fillColor;
  final TextStyle? style;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final void Function(PointerDownEvent)? onTapOutside;
  final Iterable<String>? autofillHints;
  final TextStyle? hintStyle;
  // ignore: inference_failure_on_function_return_type
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          cursorColor: Theme.of(context).primaryColor,
          cursorHeight: 3.h,
          textAlignVertical: TextAlignVertical.top,
          onTapOutside: onTapOutside ??
              (_) {
                FocusScope.of(context).unfocus();
              },
          enabled: enabled,
          autofillHints: autofillHints,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          focusNode: focusNode,
          autocorrect: false,
          keyboardType: TextInputType.text,
          controller: controller,
          onChanged: onChanged,
          style: style ??
              Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 11.5.sp,
                  ),
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: fillColor ??
                (enabled
                    ? Theme.of(context).splashColor
                    : Theme.of(context).scaffoldBackgroundColor),
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            counterText: '',
            errorMaxLines: 2,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 2.5.w),
              child: SvgPicture.asset(
                Assets.genIconsSearchAddress,
                height: 2.6.h,
                width: 2.6.w,
                colorFilter: ColorFilter.mode(
                  ThemeHelper.appColors.darkGrey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              maxWidth: 30.w,
            ),
            hintText: S.of(context).searchByAddressCity,
            hintFadeDuration: Durations.medium1,
            hintStyle: hintStyle ??
                Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeHelper.appColors.darkGrey,
                      letterSpacing: 0,
                    ),
            contentPadding: EdgeInsets.symmetric(
              vertical: contentPaddingVertical ?? 1.85.h,
              horizontal: contentPaddingHorizontal ?? 4.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              // borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error),
              borderRadius: BorderRadius.circular(8.sp),
            ),
            errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.sp),
            ),
          ),
        ),
      ],
    );
  }
}
