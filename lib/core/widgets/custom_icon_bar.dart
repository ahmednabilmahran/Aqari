import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

/// CustomIconBar is used to manage the custom icon bar
class CustomIconBar extends StatelessWidget {
  /// CustomIconBar constructor
  const CustomIconBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 8,
        bottom: 10,
      ),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ThemeHelper.appColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
