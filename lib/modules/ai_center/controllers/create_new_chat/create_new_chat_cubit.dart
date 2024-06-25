import 'package:aqari/apis/chat_api.dart';
import 'package:aqari/main.dart';
import 'package:aqari/models/chat_message_model.dart';
import 'package:aqari/models/chat_session_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_new_chat_state.dart';

/// CreateNewChatCubit
class CreateNewChatCubit extends Cubit<CreateNewChatState> {
  /// Constructor
  CreateNewChatCubit(this._chatApi) : super(CreateNewChatInitial());

  final ChatApi _chatApi;

  /// createChatSession
  Future<void> createChatSession(String userId, String message) async {
    emit(CreateNewChatLoading());
    try {
      final openAiResponse =
          await _chatApi.sendMessageToOpenAi(message, requestTitle: true);
      final assistantMessage =
          // ignore: avoid_dynamic_calls
          openAiResponse['choices'][0]['message']['content'];

      final chatSessionResponse =
          await supabaseClient.from('chat_sessions').insert({
        'user_id': userId,
        'last_message_content': assistantMessage,
        'title': assistantMessage,
      }).select();

      final sessionId = chatSessionResponse[0]['session_id'];

      await supabaseClient.from('chat_messages').insert([
        {
          'session_id': sessionId,
          'sender': 'user',
          'message': message,
        },
        {
          'session_id': sessionId,
          'sender': 'assistant',
          'message': assistantMessage,
        },
      ]);

      // Fetch the newly inserted messages
      final messageResponse = await supabaseClient
          .from('chat_messages')
          .select()
          .eq('session_id', sessionId as int)
          .order('created_at');

      final messages =
          messageResponse.map<ChatMessage>(ChatMessage.fromMap).toList();

      final chatSession = ChatSession.fromMap(chatSessionResponse[0]);

      emit(CreateNewChatSuccess(chatSession, messages));
    } catch (e) {
      emit(CreateNewChatError(e.toString()));
    }
  }
}
