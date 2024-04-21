import 'dart:io';

import 'package:aqari/core/utils/countries_helper.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/countries_flags.dart';
import 'package:aqari/models/aqari_country_model.dart';
import 'package:aqari/modules/sign_up/controllers/countries_dropdown/countries_dropdown_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// Countried DropDown Widget for Mobile
class CountriesDropDown extends StatelessWidget {
  /// Constructor
  const CountriesDropDown({
    this.enabled = true,
    super.key,
    this.onChanged,
    this.initialCountry,
  });

  /// variable boolean to identify if the DropdownButton is enabled or ot
  final bool enabled;

  /// onChanged
  final void Function(AqariCountryModel)? onChanged;

  /// Initial selected country
  final AqariCountryModel? initialCountry;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesDropDownCubit, CountriesDropDownState>(
      builder: (context, state) {
        final cubit = context.read<CountriesDropDownCubit>();
        final initialValue = initialCountry ?? cubit.selectedCountry;
        return Container(
          width: Platform.isIOS ? 19.w : 16.w,
          decoration: BoxDecoration(
            color: Theme.of(context).splashColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton(
            value: initialValue,
            selectedItemBuilder: (BuildContext context) {
              return CountriesHelper.countries.map((item) {
                return const Center(child: CountriesFlags());
              }).toList();
            },
            iconSize: enabled
                ? SizerUtil.deviceType == DeviceType.tablet
                    ? 26.sp
                    : 20.sp
                : 0.sp,
            menuMaxHeight: 60.h,
            icon: Transform.rotate(
              angle: 1.5708,
              child: Icon(
                Icons.chevron_right_rounded,
                size: 24.sp,
                color: Theme.of(context).primaryColor,
              ),
            ),
            underline: SizedX.zero,
            isExpanded: true,
            isDense: SizerUtil.deviceType == DeviceType.tablet,
            padding: EdgeInsets.zero,
            iconEnabledColor: Theme.of(context).hintColor,
            style: Theme.of(context).textTheme.bodyMedium,
            alignment: Alignment.center,
            items: CountriesHelper.countries.map((item) {
              final isSelected = cubit.selectedCountry.code == item.code;
              return DropdownMenuItem(
                value: item,
                alignment: Alignment.center,
                child: Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).shadowColor,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                ),
              );
            }).toList(),
            onChanged: enabled
                ? (value) {
                    cubit.changeValue(
                      value! as AqariCountryModel,
                    );
                    onChanged!(value as AqariCountryModel);
                  }
                : null,
          ),
        );
      },
    );
  }
}
