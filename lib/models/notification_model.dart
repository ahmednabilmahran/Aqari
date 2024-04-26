import 'package:flutter/widgets.dart';

class NotificationModel {
  // Optional: Notification type for icon

  NotificationModel(this.title, this.body, this.date, {this.icon});

  final String title;
  final String body;
  final DateTime date;
  Icon? icon;
}
