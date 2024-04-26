import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/list_notification.dart';
import 'package:aqari/models/notification_model.dart';
import 'package:flutter/material.dart';

/// NotificationsScreen is used to manage the notifications screen
class NotificationsScreen extends StatefulWidget {
  /// NotificationsScreen constructor
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationsScreen> {
  List<NotificationModel> notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Notification',
        color: ThemeHelper.appColors.primaryColor,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            ListNotification(day: 'Tomorrow'),
            ListNotification(),
            ListNotification(day: 'Yesterday '),
          ],
        ),
      ),
    );
  }
}
