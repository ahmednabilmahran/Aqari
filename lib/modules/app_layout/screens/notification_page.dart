import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aqari/models/notification_model.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../core/widgets/custom_icon-bar.dart';
import '../../../core/widgets/custom_notification_item.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Notification', style: TextStyle(color: Colors.black,fontSize: 24)),
          leading: const CustomIconBar(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    child: Text('Today', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NotificationItem();
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
