// ignore_for_file: public_member_api_docs

import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/countries_dropdown.dart';
import 'package:aqari/models/aqari_country_model.dart';
import 'package:aqari/modules/sign_up/controllers/countries_dropdown/countries_dropdown_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// this class is the custom phone number text field
class CustomPhoneNumberTextField extends StatelessWidget {
  /// constructor
  const CustomPhoneNumberTextField({
    required this.controller,
    this.label,
    this.onChanged,
    super.key,
    this.validator,
    this.initialCountry,
  });

  /// label
  final String? label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  // onchanged
  final void Function(AqariCountryModel)? onChanged;

  /// Initial selected country
  final AqariCountryModel? initialCountry;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesDropDownCubit()
        ..dropDownInitialize(
          initialCountry: initialCountry,
        ),
      child: BlocBuilder<CountriesDropDownCubit, CountriesDropDownState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label != null)
                Text(
                  label!,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).shadowColor,
                        letterSpacing: 0,
                      ),
                ),
              if (label != null) SizedX.h1,
              TextFormField(
                controller: controller,
                maxLength: context
                    .read<CountriesDropDownCubit>()
                    .selectedCountry
                    .maxPhoneLength,
                keyboardType: TextInputType.phone,
                cursorColor: Theme.of(context).primaryColor,
                cursorHeight: 3.h,
                style: Theme.of(context).textTheme.headlineMedium,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: validator,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Theme.of(context).splashColor,
                  counterStyle: const TextStyle(
                    height: double.minPositive,
                  ),
                  counterText: '',
                  errorMaxLines: 2,
                  hintFadeDuration: Durations.medium1,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.8.h,
                    horizontal: 4.w,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                    // borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                    borderSide: BorderSide(
                      color: Theme.of(context).hoverColor,
                    ),
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
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      bottom: 0.h,
                      left: 2.5.w,
                      right: 2.5.w,
                    ),
                    child: Row(
                      children: [
                        CountriesDropDown(
                          onChanged: onChanged,
                          initialCountry: initialCountry,
                        ),
                        SizedX.w1,
                        Text(
                          context
                              .read<CountriesDropDownCubit>()
                              .selectedCountry
                              .dialCode,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxWidth: 38.w,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
