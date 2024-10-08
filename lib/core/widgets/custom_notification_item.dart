import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// NotificationItem is used to manage the notification item
class NotificationItem extends StatelessWidget {
  /// Constructor
  const NotificationItem({
    required this.notification,
    super.key,
  });

  /// NotificationModel
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        notification.title,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        notification.message,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      trailing: Text(
        DateFormat.jm().format(notification.createdAt),
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.ac_unit_outlined,
            color: ThemeHelper.appColors.primaryColor,
            size: 30,
          ),
        ],
      ),
      visualDensity: const VisualDensity(
        vertical: 2,
        horizontal: 3,
      ),
      titleAlignment: ListTileTitleAlignment.titleHeight,
      isThreeLine: true,
    );
  }
}
