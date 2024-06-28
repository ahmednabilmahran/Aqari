import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

/// CustomAppBar is used to manage the Inside Screens app bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// CustomAppBar constructor
  const CustomAppBar({
    required this.titleText,
    super.key,
    this.appBarHeight = kToolbarHeight,
    this.onBackButtonPressed,
  });

  /// appBarHeight is used to manage the app bar height
  final double appBarHeight;

  /// titleText
  final String titleText;

  /// onBackButtonPressed
  final void Function()? onBackButtonPressed;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: appBarHeight,
      leadingWidth: 17.5.w,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: InkWell(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onBackButtonPressed ??
            () {
              Navigator.pop(context);
            },
        child: Align(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.sp),
              color: const Color(0XFF1B1B1B).withOpacity(0.05),
            ),
            child: Icon(
              Icons.chevron_left_rounded,
              color: Theme.of(context).primaryColor,
              size: 26.sp,
            ),
          ),
        ),
      ),
      title: Text(
        titleText,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: ThemeHelper.appColors.black,
              letterSpacing: 0.05.sp,
            ),
      ),
      backgroundColor: Theme.of(context).splashColor,
    );
  }
}
