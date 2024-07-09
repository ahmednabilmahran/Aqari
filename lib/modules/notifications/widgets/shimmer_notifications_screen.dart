import 'package:aqari/core/utils/shimmer_loading.dart';
import 'package:aqari/core/widgets/shimmer_list_notification.dart';
import 'package:flutter/material.dart';

// ignore: lines_longer_than_80_chars
/// ShimmerNotificationsScreen is used to display a shimmer effect while loading notifications
class ShimmerNotificationsScreen extends StatelessWidget {
  /// Constructor
  const ShimmerNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerLoading(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            ShimmerListNotification(
              day: 'Today',
            ),
            ShimmerListNotification(day: 'Yesterday '),
          ],
        ),
      ),
    );
  }
}
