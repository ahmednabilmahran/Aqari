import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/sized_x.dart';
import '../../core/widgets/custom_card_property.dart';
import '../../core/widgets/custom_filter.dart';
import '../../core/widgets/custom_search_field.dart';

///Favorites screen
class FavoritesScreen extends StatefulWidget {
  /// Constructor
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: 'Favorites',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedX.h1,
            DefaultTabController(
              length: 5,
              child: ButtonsTabBar(
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'House'),
                  Tab(text: 'Villa'),
                  Tab(text: 'Apartments'),
                  Tab(text: 'Commercial'),
                ],
                physics: BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.values[1],
                ),
                backgroundColor: ThemeHelper.appColors.primaryColor,
                labelSpacing: 1.5.w,
                contentPadding: EdgeInsets.symmetric(horizontal: 6.5.w),
                duration: 500,
                buttonMargin: EdgeInsets.symmetric(vertical: .5.h, horizontal: 1.5.w),
                onTap: (p0) {},
                unselectedBackgroundColor: Colors.white,
                radius: 55,
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomSearchField(
                    controller: TextEditingController(),
                  ),
                ),
                SizedX.w3,
                const IntrinsicHeight(
                  child: CustomFilter(),
                ),
              ],
            ), //CustomSearchField(),CustomFilter(),
            SizedX.h1,
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const PropertyCard(),
              separatorBuilder: (context, index) => SizedX.h2p5,
              itemCount: 10,
            ), //Listview of  PropertyCard(),
          ]),
        ),
      ),
    );
  }
}

