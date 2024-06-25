import 'package:aqari/apis/chat_api.dart';
import 'package:aqari/main.dart';
import 'package:aqari/models/chat_session_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'get_all_chats_state.dart';

/// [GetAllChatsCubit] class
class GetAllChatsCubit extends Cubit<GetAllChatsState> {
  /// [GetAllChatsCubit] constructor
  GetAllChatsCubit(this._chatApi) : super(GetAllChatsInitial());
  final ChatApi _chatApi;

  /// [chatList] variable
  List<ChatSession> chatList = [];

  /// [getAllChats] method
  Future<void> getAllChats(String userId) async {
    emit(GetAllChatsLoadingState());
    try {
      final chats = await _chatApi.getAllChats(userId);
      chatList = chats;
      emit(GetAllChatsSuccessState(chats: chatList));

      // Setup realtime listener
      supabaseClient
          .channel('public:chat_sessions')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'chat_sessions',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'user_id',
              value: supabaseClient.auth.currentUser!.id,
            ),
            callback: (event) async {
              chatList = await _chatApi.getAllChats(userId);
              emit(GetAllChatsSuccessState(chats: chatList));
            },
          )
          .subscribe();
    } catch (e) {
      emit(GetAllChatsErrorState(error: e.toString()));
    }
  }
}
