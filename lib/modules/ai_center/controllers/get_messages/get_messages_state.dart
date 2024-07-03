part of 'get_messages_cubit.dart';

/// GetMessagesState
abstract class GetMessagesState {}

/// GetMessagesInitial
class GetMessagesInitial extends GetMessagesState {}

/// GetMessagesLoadingState
class GetMessagesLoadingState extends GetMessagesState {}

/// GetMessagesErrorState
class GetMessagesErrorState extends GetMessagesState {
  /// GetMessagesErrorState
  GetMessagesErrorState({required this.error});

  /// error
  final String error;
}

/// GetMessagesSuccessState
class GetMessagesSuccessState extends GetMessagesState {
  /// GetMessagesSuccessState
  GetMessagesSuccessState({required this.messages});

  /// messages
  final List<ChatMessage> messages;
}
