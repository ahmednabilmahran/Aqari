import 'package:aqari/core/widgets/shimmer_custom_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// ListNotification is used to manage the list of notifications
class ShimmerListNotification extends StatelessWidget {
  /// ListNotification constructor
  const ShimmerListNotification({
    this.day,
    super.key,
  });

  /// day
  final String? day;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          child: Text(
            day ?? 'Today',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const ShimmerNotificationItem();
          },
        ),
      ],
    );
  }
}
