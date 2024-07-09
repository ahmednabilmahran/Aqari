import 'package:aqari/apis/units_api.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/utils/shimmer_loading.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_card_property.dart';
import 'package:aqari/core/widgets/shimmer_custom_card_property.dart';
import 'package:aqari/main.dart';
import 'package:aqari/modules/favorites/controllers/favorites_cubit.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// FavoritesScreen is used to manage the favorites screen
class FavoritesScreen extends StatelessWidget {
  /// Constructor
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(
        getIt<UnitsApi>(),
      )..fetchFavorites(supabaseClient.auth.currentUser!.id),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const CustomAppBar(titleText: 'Favorites'),
            body: RefreshIndicator.adaptive(
              onRefresh: () async {
                await context.read<FavoritesCubit>().fetchFavorites(
                      supabaseClient.auth.currentUser!.id,
                    );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedX.h1,
                      DefaultTabController(
                        length: 5,
                        child: Column(
                          children: [
                            ButtonsTabBar(
                              tabs: const [
                                Tab(text: 'All'),
                                Tab(text: 'House'),
                                Tab(text: 'Villa'),
                                Tab(text: 'Flat'),
                                Tab(text: 'Commercial'),
                              ],
                              physics: BouncingScrollPhysics(
                                decelerationRate:
                                    ScrollDecelerationRate.values[1],
                              ),
                              backgroundColor:
                                  ThemeHelper.appColors.primaryColor,
                              labelSpacing: 1.5.w,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 6.5.w),
                              duration: 500,
                              buttonMargin: EdgeInsets.symmetric(
                                vertical: .5.h,
                                horizontal: 1.5.w,
                              ),
                              onTap: (index) {
                                final categories = [
                                  'All',
                                  'House',
                                  'Villa',
                                  'Flat',
                                  'Commercial',
                                ];
                                context
                                    .read<FavoritesCubit>()
                                    .filterFavorites(categories[index]);
                              },
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
                            SizedBox(
                              height: 1.h,
                            ),
                            BlocBuilder<FavoritesCubit, FavoritesState>(
                              builder: (context, state) {
                                if (state is FavoritesLoading) {
                                  return ShimmerLoading(
                                    child: ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return const ShimmerPropertyCard(
                                          title: '',
                                          location: '',
                                          area: '',
                                          bedrooms: '',
                                          bathrooms: '',
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedX.h2p5,
                                      itemCount: 15,
                                    ),
                                  );
                                } else if (state is FavoritesError) {
                                  return Center(child: Text(state.error));
                                } else if (state is FavoritesLoaded) {
                                  return ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final unit = state.favorites[index];
                                      return PropertyCard(
                                        imagePath: unit.mainImageUrl,
                                        title: unit.title,
                                        location: unit.city,
                                        area: unit.areaMeter.toString(),
                                        bedrooms: unit.bedrooms.toString(),
                                        bathrooms: unit.bathrooms.toString(),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedX.h2p5,
                                    itemCount: state.favorites.length,
                                  );
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
              ),
            ),
          );
        },
      ),
    );
  }
}
