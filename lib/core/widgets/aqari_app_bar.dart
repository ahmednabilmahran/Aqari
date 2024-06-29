import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/app_values.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/main.dart';
import 'package:aqari/modules/views/favorit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// this class is the custom app bar

/// AqariAppBar is used to manage the app bar for the app
class AqariAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// AqariAppBar constructor
  const AqariAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppValues.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: AppValues.appBarHeight,
      leading: const SizedBox(),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: false,
      scrolledUnderElevation: 0,
      leadingWidth: 0.5.w,
      title: SvgPicture.asset(
        fit: BoxFit.cover,
        height: 3.2.h,
        width: 3.2.w,
        Assets.genIconsLogoText,
      ),
      backgroundColor: Theme.of(context).splashColor,
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const FavoritesScreen(),
              ),
            );
          },
          visualDensity: const VisualDensity(horizontal: -4),
          icon: SvgPicture.asset(
            Assets.genIconsFavorites,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
            height: 2.5.h,
            width: 2.5.w,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pushNamed(
              navigatorKey.currentContext!,
              Routes.settingScreen,
            );
          },
          icon: SvgPicture.asset(
            Assets.genIconsNotifications,
            height: 3.5.h,
            width: 3.5.w,
          ),
        ),
      ],
    );
  }
}
