import 'dart:io';

import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/explore/screens/explore_screen.dart';
import 'package:aqari/modules/home/screens/home_screen.dart';
import 'package:aqari/modules/profile/screens/profile_screen.dart';
import 'package:aqari/modules/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

/// AppLayoutScreen
class AppLayoutScreen extends StatelessWidget {
  /// Constructor
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeHelper.changeSystemUiOverlayStyle(context);

    PersistentTabController controller;
    controller = PersistentTabController();

    return PersistentTabView(
      padding: Platform.isAndroid
          ? NavBarPadding.only(
              bottom: 1.25.h,
            )
          : const NavBarPadding.all(null),
      context,
      controller: controller,
      screens: [
        HomeScreen(),
        const SearchScreen(),
        const ExploreScreen(),
        const ProfileScreen(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(Assets.genIconsHome),
          title: S.of(context).home,
          contentPadding: 0.9.h,
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(Assets.genIconsSearch),
          title: S.of(context).search,
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(Assets.genIconsExplore),
          title: S.of(context).explore,
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(Assets.genIconsProfile),
          title: S.of(context).profile,
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      resizeToAvoidBottomInset: true,
      navBarHeight: Platform.isAndroid ? 8.5.h : 6.8.h,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      onItemSelected: (int index) {
        ThemeHelper.changeSystemUiOverlayStyle(context);
      },
      navBarStyle: NavBarStyle.style3,
    );
  }
}
