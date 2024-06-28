import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_card_apartment.dart';
import 'package:aqari/modules/app_layout/controllers/app_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// SearchScreen
class SearchScreen extends StatelessWidget {
  /// constructor
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'search',
        onBackButtonPressed: () {
          context.read<AppLayoutCubit>().changeIndex(0);
        },
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 10,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return const CustomCardApartment();
        },
      ),
    );
  }
}
