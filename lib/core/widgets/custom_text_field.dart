// ignore_for_file: public_member_api_docs

import 'package:aqari/core/utils/sized_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

/// this class is the custom text field
class CustomTextField extends StatelessWidget {
  /// constructor
  const CustomTextField({
    required this.controller,
    super.key,
    this.hintText,
    this.focusNode,
    this.label,
    this.readOnly = false,
    this.useBorder = true,
    this.borderRadius = 6,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.prefixWidget,
    this.suffixWidget,
    this.lines,
    this.inputFormatters,
    this.obscureText = false,
    this.enabled = true,
    this.maxLength,
    this.fillColor,
    this.style,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.labelTextStyle,
    this.onTapOutside,
    this.autofillHints,
    this.hintStyle,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? hintText;

  final String? label;
  final TextInputType? keyboardType;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool obscureText;
  final int? lines;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool? readOnly;
  final bool useBorder;
  final TextStyle? labelTextStyle;
  final double? borderRadius;
  final int? maxLength;
  final Color? fillColor;
  final TextStyle? style;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final void Function(PointerDownEvent)? onTapOutside;
  final Iterable<String>? autofillHints;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            textAlign: TextAlign.left,
            style: labelTextStyle ??
                Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).shadowColor,
                      letterSpacing: 0,
                    ),
          ),
        if (label != null) SizedX.h1,
        TextFormField(
          cursorColor: Theme.of(context).primaryColor,
          cursorHeight: 3.h,
          textAlignVertical: TextAlignVertical.top,
          readOnly: readOnly!,
          onTapOutside: onTapOutside ??
              (_) {
                FocusScope.of(context).unfocus();
              },
          enabled: enabled,
          autofillHints: autofillHints,
          validator: validator,
          focusNode: focusNode,
          autocorrect: false,
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: '*',
          onChanged: onChanged,
          maxLines: lines ?? 1,
          maxLength: maxLength,
          style: style ?? Theme.of(context).textTheme.headlineMedium,
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
            prefixIcon: prefixWidget,
            suffixIcon: suffixWidget,
            suffixIconConstraints: BoxConstraints(minWidth: 15.w),
            hintText: hintText,
            hintFadeDuration: Durations.medium1,
            hintStyle: hintStyle ??
                Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).hintColor,
                      letterSpacing: 0,
                    ),
            contentPadding: EdgeInsets.symmetric(
              vertical: contentPaddingVertical ?? 1.5.h,
              horizontal: contentPaddingHorizontal ?? 4.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              // borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: useBorder
                  ? BorderSide(
                      color: Theme.of(context).hoverColor,
                    )
                  : BorderSide.none,
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
              borderSide: BorderSide(color: Theme.of(context).hoverColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).hoverColor),
              borderRadius: BorderRadius.circular(8.sp),
            ),
          ),
        ),
      ],
    );
  }
}
