/// ChatSession model class
class ChatSession {
  /// ChatSession constructor
  ChatSession({
    required this.sessionId,
    required this.userId,
    required this.title,
    required this.createdAt,
    required this.lastMessageContent,
  });

  /// ChatSession factory
  factory ChatSession.fromMap(Map<String, dynamic> map) {
    return ChatSession(
      sessionId: map['session_id'] as int,
      userId: map['user_id'] as String,
      title: map['title'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      lastMessageContent: map['last_message_content'] as String,
    );
  }

  /// ChatSession factory
  final int sessionId;

  /// ChatSession factory
  final String userId;

  /// ChatSession factory
  final String title;

  /// ChatSession factory
  final DateTime createdAt;

  /// ChatSession factory
  final String lastMessageContent;
}
