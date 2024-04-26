import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// CustomAppBar is used to manage the Inside Screens app bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// CustomAppBar constructor
  const CustomAppBar({
    required this.titleText,
    super.key,
    this.appBarHeight = kToolbarHeight,
    this.actionIcon,
    this.onBackButtonPressed,
    this.color,
  });

  /// appBarHeight is used to manage the app bar height
  final double appBarHeight;

  /// action icon button
  final String? actionIcon;

  /// titleText
  final String titleText;

  /// color
  final Color? color;

  /// onBackButtonPressed
  final void Function()? onBackButtonPressed;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: appBarHeight,
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
          child: Icon(
            Icons.chevron_left_rounded,
            color: color ?? Colors.black,
            size: 40,
          ),
        ),
      ),
      title: Text(
        titleText,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      backgroundColor: Colors.transparent,
      actions: actionIcon == null
          ? []
          : [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                onPressed: () {},
                icon: Align(
                  child: SvgPicture.asset(
                    actionIcon!,
                  ),
                ),
              ),
            ],
    );
  }
}
