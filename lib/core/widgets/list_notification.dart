import 'package:flutter/material.dart';

import 'custom_notification_item.dart';

class ListNotification extends StatelessWidget {
  ListNotification({
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(day??'Today', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return NotificationItem();
          },
        ),
      ],
    );
  }
}
