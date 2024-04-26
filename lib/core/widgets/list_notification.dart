import 'package:aqari/core/widgets/custom_notification_item.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            day ?? 'Today',
            style: const TextStyle(
              fontSize: 18,
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
