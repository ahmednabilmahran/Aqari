// notifications_state.dart
part of 'notifications_cubit.dart';

/// NotificationsState class
abstract class NotificationsState {}

/// NotificationsInitial class
class NotificationsInitial extends NotificationsState {}

/// NotificationsLoading class
class NotificationsLoading extends NotificationsState {}

/// NotificationsLoaded class
class NotificationsLoaded extends NotificationsState {
  /// NotificationsLoaded constructor
  NotificationsLoaded(this.notifications);

  /// List of notifications
  final List<NotificationModel> notifications;
}

/// NotificationsError class
class NotificationsError extends NotificationsState {
  /// NotificationsError constructor
  NotificationsError(this.message);

  /// Error message
  final String message;
}
