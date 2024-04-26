import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aqari/models/notification_model.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../core/widgets/custom_icon-bar.dart';
import '../../../core/widgets/custom_notification_item.dart';
import '../../../core/widgets/list_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleText: 'Notification',
          color: ThemeHelper.appColors.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              ListNotification(day: 'Tomorrow'),
              ListNotification(),
              ListNotification(day: 'Yesterday '),
            ],
          ),
        ));
  }
}
