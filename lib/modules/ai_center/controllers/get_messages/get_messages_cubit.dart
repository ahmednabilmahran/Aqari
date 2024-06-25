import 'package:aqari/apis/chat_api.dart';
import 'package:aqari/main.dart';
import 'package:aqari/models/chat_message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'get_messages_state.dart';

/// GetMessagesCubit
class GetMessagesCubit extends Cubit<GetMessagesState> {
  /// GetMessagesCubit
  GetMessagesCubit(this._chatApi, this.sessionId) : super(GetMessagesInitial());
  final ChatApi _chatApi;

  /// sessionId
  int sessionId;

  /// messageList
  List<ChatMessage> messageList = [];

  /// updateSessionId
  void updateSessionId(int newSessionId) {
    sessionId = newSessionId;
    getAllMessages(); // Fetch messages for the updated session
  }

  /// getAllMessages
  Future<void> getAllMessages() async {
    emit(GetMessagesLoadingState());
    try {
      final messages = await _chatApi.getMessages(sessionId);
      messageList = messages;
      emit(GetMessagesSuccessState(messages: messageList));

      // Setup realtime listener
      supabaseClient
          .channel('public:chat_messages')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'chat_messages',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'session_id',
              value: sessionId,
            ),
            callback: (event) async {
              messageList = await _chatApi.getMessages(sessionId);
              emit(GetMessagesSuccessState(messages: messageList));
            },
          )
          .subscribe();
    } catch (e) {
      emit(GetMessagesErrorState(error: e.toString()));
    }
  }
}
