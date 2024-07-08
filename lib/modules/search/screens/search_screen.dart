import 'package:aqari/apis/units_api.dart';
import 'package:aqari/core/utils/shimmer_loading.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_search_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/app_layout/controllers/app_layout_cubit.dart';
import 'package:aqari/modules/search/controllers/custom_filter/custom_filter_cubit.dart';
import 'package:aqari/modules/search/controllers/search/search_cubit.dart';
import 'package:aqari/modules/search/widgets/custom_filter.dart';
import 'package:aqari/modules/search/widgets/search_result_header.dart';
import 'package:aqari/modules/search/widgets/search_unit_card.dart';
import 'package:aqari/modules/search/widgets/start_search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// SearchScreen
class SearchScreen extends StatelessWidget {
  /// SearchScreen
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CustomFilterCubit(),
        ),
        BlocProvider(
          create: (_) => SearchCubit(UnitsApi()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: S.of(context).search,
          onBackButtonPressed: () {
            context.read<AppLayoutCubit>().changeIndex(0);
          },
        ),
        body: BlocBuilder<CustomFilterCubit, CustomFilterState>(
          builder: (context, state) {
            return BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return Column(
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
                                        controller: context
                                            .read<SearchCubit>()
                                            .searchController,
                                        onFieldSubmitted: (value) {
                                          final filterState = context
                                              .read<CustomFilterCubit>()
                                              .state;
                                          context
                                              .read<SearchCubit>()
                                              .searchUnits(
                                                value,
                                                filterState,
                                              );
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedX.w3,
                                    BlocBuilder<CustomFilterCubit,
                                        CustomFilterState>(
                                      builder: (context, state) {
                                        return CustomFilter(
                                          filterCubit:
                                              context.read<CustomFilterCubit>(),
                                          searchCubit:
                                              context.read<SearchCubit>(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedX.h1,
                                BlocBuilder<SearchCubit, SearchState>(
                                  builder: (context, state) {
                                    if (state is SearchLoading) {
                                      return ShimmerLoading(
                                        child: SearchResultHeader(
                                          searchTerm: context
                                              .read<SearchCubit>()
                                              .searchController
                                              .text,
                                          resultCount: 000,
                                        ),
                                      );
                                    } else if (state is SearchLoaded) {
                                      return SearchResultHeader(
                                        searchTerm: context
                                            .read<SearchCubit>()
                                            .searchController
                                            .text,
                                        resultCount: state.units.length,
                                      );
                                    } else if (state is SearchError) {
                                      return Text(state.error);
                                    }
                                    return Container();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchLoading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (state is SearchLoaded) {
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 3.w,
                                mainAxisSpacing: 1.5.h,
                                childAspectRatio: 0.91,
                              ),
                              padding: EdgeInsets.only(
                                top: 2.5.h,
                                left: 3.w,
                                right: 3.w,
                              ),
                              itemCount: state.units.length,
                              itemBuilder: (context, index) {
                                final unit = state.units[index];
                                return SearchUnitCard(
                                  imagePath: unit.mainImageUrl,
                                  title: unit.title,
                                  rooms: unit.bedrooms,
                                  areaMeter: unit.areaMeter,
                                  location: unit.city,
                                );
                              },
                            );
                          } else if (state is SearchError) {
                            return Center(
                              child: Text(state.error),
                            );
                          }
                          return const StartSearchSection();
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
