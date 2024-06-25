part of 'create_new_chat_cubit.dart';

/// CreateNewChatState
abstract class CreateNewChatState {}

/// Initial state
class CreateNewChatInitial extends CreateNewChatState {}

/// Loading state
class CreateNewChatLoading extends CreateNewChatState {}

/// Success state
class CreateNewChatSuccess extends CreateNewChatState {
  /// CreateNewChatSuccess constructor
  CreateNewChatSuccess(this.chatSession, this.messages);

  /// chatSession
  final ChatSession chatSession;

  /// messages
  final List<ChatMessage> messages;
}

/// Error state
class CreateNewChatError extends CreateNewChatState {
  /// CreateNewChatError constructor
  CreateNewChatError(this.error);

  /// error
  final String error;
}
