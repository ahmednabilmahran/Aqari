import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/ai_center/screens/ai_center_screen.dart';
import 'package:aqari/modules/app_layout/controllers/app_layout_cubit.dart';
import 'package:aqari/modules/home/screens/home_screen.dart';
import 'package:aqari/modules/profile/screens/profile_screen.dart';
import 'package:aqari/modules/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// AppLayoutScreen
class AppLayoutScreen extends StatelessWidget {
  /// AppLayoutScreen constructor
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeHelper.changeSystemUiOverlayStyle(context);

    final screens = <Widget>[
      const HomeScreen(),
      SearchScreen(),
      const AiCenterScreen(),
      const ProfileScreen(),
    ];

    return BlocProvider(
      create: (context) => AppLayoutCubit(),
      child: BlocBuilder<AppLayoutCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: screens[state],
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.6.h),
                    child: SvgPicture.asset(
                      Assets.genIconsHome,
                      height: 3.2.h,
                      width: 3.2.w,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.6.h),
                    child: SvgPicture.asset(
                      Assets.genIconsHome,
                      height: 3.2.h,
                      width: 3.2.w,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: S.of(context).home,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.6.h),
                    child: SvgPicture.asset(
                      Assets.genIconsSearch,
                      height: 3.2.h,
                      width: 3.2.w,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.6.h),
                    child: SvgPicture.asset(
                      Assets.genIconsSearch,
                      height: 3.2.h,
                      width: 3.2.w,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: S.of(context).search,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.6.h),
                    child: SvgPicture.asset(
                      Assets.genIconsAiCenter,
                      height: 3.3.h,
                      width: 3.3.w,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).shadowColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.6.h),
                    child: SvgPicture.asset(
                      Assets.genIconsAiCenter,
                      height: 3.3.h,
                      width: 3.3.w,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: S.of(context).aiCenter,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.6.h),
                    child: SvgPicture.asset(
                      Assets.genIconsProfile,
                      height: 3.2.h,
                      width: 3.2.w,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.6.h),
                    child: SvgPicture.asset(
                      Assets.genIconsProfile,
                      height: 3.2.h,
                      width: 3.2.w,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: S.of(context).profile,
                ),
              ],
              currentIndex: state,
              onTap: (index) =>
                  context.read<AppLayoutCubit>().changeIndex(index),
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).shadowColor,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle:
                  Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                      ),
              selectedLabelStyle:
                  Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
            ),
          );
        },
      ),
    );
  }
}
