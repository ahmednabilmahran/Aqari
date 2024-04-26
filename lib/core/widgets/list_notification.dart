import 'package:aqari/core/widgets/custom_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ListNotification extends StatelessWidget {
  const ListNotification({
    this.day,
    super.key,
  });

  final String? day;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          child: Text(
            day ?? 'Today',
            style:  TextStyle(
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
            return const NotificationItem();
          },
        ),
      ],
    );
  }
}
