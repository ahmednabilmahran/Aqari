import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Tour Booked Successfully',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      trailing: Text(
        DateFormat.jm().format(DateTime.now()),
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
