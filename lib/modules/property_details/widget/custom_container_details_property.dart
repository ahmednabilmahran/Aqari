import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

/// CustomContainerDetailsProperty widget to manage the property details
class CustomContainerDetailsProperty extends StatelessWidget {
  /// CustomContainerDetailsProperty widget to manage the property details
  const CustomContainerDetailsProperty({
    super.key,
    this.image,
    this.title,
    this.subTitle,
  });

  final String? image;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null) ...[SvgPicture.asset(image!)],
          if (title != null) ...[
            Text(
              title!,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
          if (subTitle != null) ...[
            Text(
              subTitle!,
              style: TextStyle(fontSize: 10.sp),
            ),
          ],
        ],
      ),
    );
  }
}
