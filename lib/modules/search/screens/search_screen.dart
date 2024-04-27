import 'package:aqari/core/utils/theme_helper.dart';

import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import '../../../core/widgets/custom_card_apartment.dart';

/// SearchScreen
class SearchScreen extends StatelessWidget {
  /// constructor
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'search',
        color: ThemeHelper.appColors.primaryColor,
        style: TextStyle(
          color: ThemeHelper.appColors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body:  GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 10,
            childAspectRatio: 1
          ),
          itemCount: 16,
          itemBuilder: (context, index) {
            return const CustomeCardApartment();
          },),
    );
  }
}


