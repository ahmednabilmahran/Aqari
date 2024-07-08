import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_search_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/app_layout/controllers/app_layout_cubit.dart';
import 'package:aqari/modules/search/controllers/custom_filter/custom_filter_cubit.dart';
import 'package:aqari/modules/search/widgets/custom_filter.dart';
import 'package:aqari/modules/search/widgets/search_result_header.dart';
import 'package:aqari/modules/search/widgets/search_unit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// SearchScreen
class SearchScreen extends StatelessWidget {
  /// constructor
  SearchScreen({super.key});

  /// houses
  final List<House> houses = [
    House(image: Assets.genImagesTest1, location: 'Location 1'),
    House(image: Assets.genImagesTest2, location: 'Location 2'),
    House(image: Assets.genImagesTest3, location: 'Location 3'),
    House(image: Assets.genImagesTest4, location: 'Location 4'),
    House(image: Assets.genImagesTest5, location: 'Location 5'),
    House(image: Assets.genImagesTest6, location: 'Location 6'),
    House(image: Assets.genImagesTest7, location: 'Location 7'),
    House(image: Assets.genImagesTest8, location: 'Location 8'),
    House(image: Assets.genImagesTest1, location: 'Location 1'),
    House(image: Assets.genImagesTest2, location: 'Location 2'),
    House(image: Assets.genImagesTest3, location: 'Location 3'),
    House(image: Assets.genImagesTest4, location: 'Location 4'),
    House(image: Assets.genImagesTest5, location: 'Location 5'),
    House(image: Assets.genImagesTest6, location: 'Location 6'),
    House(image: Assets.genImagesTest7, location: 'Location 7'),
    House(image: Assets.genImagesTest8, location: 'Location 8'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomFilterCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: S.of(context).search,
          onBackButtonPressed: () {
            context.read<AppLayoutCubit>().changeIndex(0);
          },
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Column(
                children: [
                  CustomPadding(
                    child: Column(
                      children: [
                        SizedX.h0p25,
                        SizedX.h0p5,
                        Row(
                          children: [
                            Expanded(
                              child: CustomSearchField(
                                controller: TextEditingController(),
                              ),
                            ),
                            SizedX.w3,
                            BlocBuilder<CustomFilterCubit, CustomFilterState>(
                              builder: (context, state) {
                                return CustomFilter(
                                  filterCubit:
                                      context.read<CustomFilterCubit>(),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedX.h1,
                        const SearchResultHeader(
                          searchTerm: 'Apartment',
                          resultCount: 160,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // const StartSearchSection(),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 1.5.h,
                  childAspectRatio: 0.94,
                ),
                padding: EdgeInsets.only(
                  top: 2.5.h,
                  left: 3.w,
                  right: 3.w,
                ),
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  return SearchUnitCard(
                    imagePath: houses[index].image,
                    title: houses[index].location,
                    details: 'Details',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// House
class House {
  /// Constructor
  House({required this.image, required this.location});

  /// image
  final String image;

  /// location
  final String location;
}
