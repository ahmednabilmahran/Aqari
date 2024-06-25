part of 'get_all_chats_cubit.dart';

/// This file contains the state of the GetAllChatsState class.
abstract class GetAllChatsState {}

/// This class is the initial state of the GetAllChatsState class.
class GetAllChatsInitial extends GetAllChatsState {}

/// This class is the loading state of the GetAllChatsState class.
class GetAllChatsLoadingState extends GetAllChatsState {}

/// This class is the error state of the GetAllChatsState class.
class GetAllChatsErrorState extends GetAllChatsState {
  /// This class is the error state of the GetAllChatsState class.
  GetAllChatsErrorState({required this.error});

  /// This class is the error state of the GetAllChatsState class.
  final String error;
}

/// This class is the success state of the GetAllChatsState class.
class GetAllChatsSuccessState extends GetAllChatsState {
  /// This class is the success state of the GetAllChatsState class.
  GetAllChatsSuccessState({required this.chats});

  /// This class is the success state of the GetAllChatsState class.
  final List<ChatSession> chats;
}
