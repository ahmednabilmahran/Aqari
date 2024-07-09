/// Notification Model
class NotificationModel {
  /// Constructor
  NotificationModel({
    required this.notificationId,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    required this.status,
    required this.isRead,
    required this.createdAt,
    this.readAt,
  });

  /// fromJson
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationId: json['notification_id'] as int,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      isRead: json['is_read'] as bool,
      readAt: json['read_at'] != null
          ? DateTime.parse(json['read_at'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// Notification ID
  final int notificationId;

  /// User ID
  final String userId;

  /// Title
  final String title;

  /// Message
  final String message;

  /// Type
  final String type;

  /// Status
  final String status;

  /// Is Read
  final bool isRead;

  /// Read At
  final DateTime? readAt;

  /// Created At
  final DateTime createdAt;

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'notification_id': notificationId,
      'user_id': userId,
      'title': title,
      'message': message,
      'type': type,
      'status': status,
      'is_read': isRead,
      'read_at': readAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}
