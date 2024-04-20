import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';

/// Analytics helper class to handle all analytics related operations
class AnalyticsHelper {
  /// Firebase analytics instance
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  /// Log an event with the given [name] and [parameters]
  /// [name] is the name of the event
  /// [parameters] is the map of parameters to be logged with the event
  /// [parameters] can be null
  static Future<void> logEvent(
    String name, [
    Map<String, dynamic>? parameters,
  ]) async {
    await analytics.logEvent(name: name, parameters: parameters);
  }

  /// Set the current screen name to [screenName]
  /// [screenName] is the name of the screen
  /// [screenClass] is the name of the screen class
  /// [screenClass] can be null
  static Future<void> logScreenView(
    String screenName, [
    String? screenClass,
  ]) async {
    await analytics.logScreenView(
      screenName: screenName,
      screenClass: Platform.isAndroid ? 'Android' : 'iOS',
    );
  }

  /// Set the user id to [userId]
  /// [userId] is the id of the user
  /// [userId] can be null
  /// [name] is the name of the user
  static Future<void> setUserId(String userId, [String? name]) async {
    await analytics.setUserId(
      id: userId,
    );
  }
}
