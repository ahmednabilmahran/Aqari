import 'package:flutter/widgets.dart';

/// NotificationModel is used to manage the notification model
class NotificationModel {
  /// NotificationModel constructor
  NotificationModel(this.title, this.body, this.date, {this.icon});

  /// title
  final String title;

  /// body
  final String body;

  /// date
  final DateTime date;

  /// icon
  final Icon? icon;
}
