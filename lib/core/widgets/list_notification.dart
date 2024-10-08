import 'package:aqari/core/widgets/custom_notification_item.dart';
import 'package:aqari/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// ListNotification is used to manage the list of notifications
class ListNotification extends StatelessWidget {
  /// Constructor
  const ListNotification({
    required this.notifications,
    this.day,
    super.key,
  });

  /// Day
  final String? day;

  /// List of notifications
  final List<NotificationModel> notifications;

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
          itemCount: notifications.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return NotificationItem(notification: notifications[index]);
          },
        ),
      ],
    );
  }
}
