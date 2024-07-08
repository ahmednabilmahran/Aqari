import 'package:aqari/apis/chat_api.dart';
import 'package:aqari/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [SendMessageCubit] class
class SendMessageCubit extends Cubit<void> {
  /// [SendMessageCubit] constructor
  SendMessageCubit(this._chatApi) : super(null);
  final ChatApi _chatApi;

  /// [messageController] variable
  final TextEditingController messageController = TextEditingController();

  /// [sendMessage] method
  Future<ChatMessage> sendMessage({
    required String message,
    required int sessionId,
  }) async {
    try {
      // Generate a unique messageId and get the current timestamp
      final assistantMessageId = DateTime.now().millisecondsSinceEpoch;
      final timestamp = DateTime.now().toUtc();

      // Send the message to the backend
      await _chatApi.sendMessage(sessionId, message);
      final response = await _chatApi.sendMessageToOpenAi(message);

      // Extract the message content from the response
      final assistantMessageContent =
          // ignore: avoid_dynamic_calls
          response['choices'][0]['message']['content'];

      // Create the ChatMessage object
      final assistantMessage = ChatMessage(
        messageId: assistantMessageId,
        sessionId: sessionId,
        sender: 'assistant',
        message: assistantMessageContent as String,
        createdAt: timestamp,
      );

      return assistantMessage;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
