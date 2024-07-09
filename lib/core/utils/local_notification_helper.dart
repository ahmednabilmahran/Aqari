import 'dart:convert';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Handles the creation and management of local notifications.
class LocalNotificationService {
  /// Factory constructor
  factory LocalNotificationService() => _singletonInstance;

  // Named constructor
  LocalNotificationService._internal();
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Singleton instance
  static final LocalNotificationService _singletonInstance =
      LocalNotificationService._internal();

  /// Initializes notification settings for Android and iOS platforms.
  Future<void> initializeSettings() async {
    const androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final iosInitializationSettings = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        // Handle iOS foreground notification
      },
    );

    final initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) async {
        // Handle notification tap
        await _handleNotificationTap(response.payload);
      },
    );
  }

  /// Requests notification permissions for iOS platform.
  Future<void> requestIOSPermissions() async {
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  /// Displays a basic notification with a title and body.
  Future<void> showBasicNotification({
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );

    const platformDetails = NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      Random().nextInt(1000000),
      title,
      body,
      platformDetails,
      payload: jsonEncode(payload),
    );
  }

  /// Displays a notification with a progress indicator for downloads.
  Future<void> showDownloadNotification({
    required String title,
    required String body,
    required int downloadProgress,
  }) async {
    // Build the notification with progress indicator
    final androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      // ongoing: true, // Set it as an ongoing notification
      showProgress: true, // Show progress indicator
      maxProgress: 100, // Set the maximum progress (in this case, 100%)
      ongoing:
          true, // Set it as an ongoing notification// Set the maximum progress (in this case, 100%)
      progress: downloadProgress, // Update progress
      icon: '@drawable/folder',
    );

    final platformDetails = NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      Random().nextInt(1000000), // Use a unique ID for each notification

      title,
      body,
      platformDetails,
      payload: jsonEncode({'downloadProgress': downloadProgress}),
    );
  }

  /// Cancels all scheduled notifications.
  Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }

  /// Handles the action when a notification is tapped.
  Future<void> _handleNotificationTap(String? payload) async {}
}
