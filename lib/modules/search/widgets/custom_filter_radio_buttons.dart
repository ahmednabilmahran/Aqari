import 'package:aqari/modules/search/controllers/custom_filter/custom_filter_cubit.dart';
import 'package:aqari/modules/search/widgets/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// CustomFilterRadioButtons widget to display radio buttons for custom filter.
class CustomFilterRadioButtons extends StatelessWidget {
  /// Constructor
  const CustomFilterRadioButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomFilterCubit, CustomFilterState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomRadio(context: context, state: state, value: 'House'),
            CustomRadio(context: context, state: state, value: 'Commercial'),
            CustomRadio(context: context, state: state, value: 'Flat'),
            CustomRadio(context: context, state: state, value: 'Villa'),
          ],
        );
      },
    );
  }
}
