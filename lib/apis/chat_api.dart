import 'dart:convert';
import 'dart:developer';

import 'package:aqari/main.dart';
import 'package:aqari/models/chat_message_model.dart';
import 'package:aqari/models/chat_session_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton

/// [ChatApi] class
class ChatApi {
  /// [openAiApiKey] variable
  String openAiApiKey =
      'sk-proj-wVyvXST4h2uUvuF6GVilT3BlbkFJDfbkfZW5cXu8Tn50xZpw';

  /// [getAllChats] method to get all chats
  Future<List<ChatSession>> getAllChats(String userId) async {
    final response = await supabaseClient
        .from('chat_sessions')
        .select()
        .eq('user_id', userId);

    final data = response;
    return data.map<ChatSession>(ChatSession.fromMap).toList();
  }

  /// [sendMessageToOpenAi] method to send message to OpenAI
  Future<Map<String, dynamic>> sendMessageToOpenAi(
    String message, {
    bool requestTitle = false,
  }) async {
    final messages = [
      {'role': 'user', 'content': message},
      if (requestTitle)
        {
          'role': 'system',
          'content':
              // ignore: lines_longer_than_80_chars
              'Please provide a short and relevant title for this conversation based on the user message and assistant response.',
        },
    ];

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $openAiApiKey',
      },
      body: jsonEncode({
        'model': 'gpt-4o',
        'messages': messages,
        'max_tokens': 500,
        'temperature': 0.0,
      }),
    );

    if (response.statusCode == 200) {
      // Decode the response body to ensure proper encoding
      final responseBody = utf8.decode(response.bodyBytes);
      log(responseBody);
      return jsonDecode(responseBody) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to send message to OpenAI');
    }
  }

  /// [sendMessage] method to send message
  Future<void> sendMessage(int sessionId, String userMessage) async {
    final openAiResponse = await sendMessageToOpenAi(userMessage);
    // ignore: avoid_dynamic_calls
    final assistantMessage = openAiResponse['choices'][0]['message']['content'];

    await supabaseClient.from('chat_messages').insert([
      {
        'session_id': sessionId,
        'sender': 'user',
        'message': userMessage,
      },
      {
        'session_id': sessionId,
        'sender': 'assistant',
        'message': assistantMessage,
      },
    ]);

    await supabaseClient.from('chat_sessions').update(
      {
        'last_message_content': assistantMessage,
        'last_message_date': DateTime.now().toUtc().toIso8601String(),
      },
    ).eq('session_id', sessionId);
  }

  /// [getMessages] method to get messages
  Future<List<ChatMessage>> getMessages(int sessionId) async {
    final response = await supabaseClient
        .from('chat_messages')
        .select()
        .eq('session_id', sessionId);

    final data = response;
    return data.map<ChatMessage>(ChatMessage.fromMap).toList();
  }
}
