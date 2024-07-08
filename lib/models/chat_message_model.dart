/// ChatMessage model class
class ChatMessage {
  /// ChatMessage constructor
  ChatMessage({
    required this.messageId,
    required this.sessionId,
    required this.sender,
    required this.message,
    required this.createdAt,
  });

  /// ChatMessage factory
  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      messageId: map['message_id'] as int,
      sessionId: map['session_id'] as int,
      sender: map['sender'] as String,
      message: map['message'] as String,
      createdAt: DateTime.parse(map['created_at'] as String).toUtc(),
    );
  }

  /// ChatMessage factory
  final int messageId;

  /// ChatMessage factory
  final int sessionId;

  /// ChatMessage factory
  final String sender;

  /// ChatMessage factory
  final String message;

  /// ChatMessage factory
  final DateTime createdAt;
}
