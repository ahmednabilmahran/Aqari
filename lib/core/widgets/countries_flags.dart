import 'dart:io';

import 'package:aqari/modules/sign_up/controllers/countries_dropdown/countries_dropdown_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// Countries Flags
class CountriesFlags extends StatelessWidget {
  /// Constructor
  const CountriesFlags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesDropDownCubit, CountriesDropDownState>(
      builder: (context, state) {
        return Text(
          Platform.isIOS
              ? context.read<CountriesDropDownCubit>().selectedCountry.flag
              : context.read<CountriesDropDownCubit>().selectedCountry.code,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: Platform.isIOS ? 28.sp : 14.sp,
                fontWeight: FontWeight.w400,
              ),
        );
      },
    );
  }
}
