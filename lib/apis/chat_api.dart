import 'dart:convert';

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

  /// [createChatSession] method to create chat session
  Future<void> createChatSession({
    required String userId,
    required String title,
  }) async {
    await supabaseClient.from('chat_sessions').insert({
      'user_id': userId,
      'title': title,
    });
  }

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
        'model': 'gpt-4',
        'messages': messages,
        'max_tokens': 150,
        'temperature': 0.7,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to send message to OpenAI');
    }
  }

  /// [createNewChatSession] method to create new chat session
  Future<void> createNewChatSession(String userId, String message) async {
    final openAiResponse =
        await sendMessageToOpenAi(message, requestTitle: true);
    // ignore: avoid_dynamic_calls
    final assistantMessage = openAiResponse['choices'][0]['message']['content'];
    // ignore: avoid_dynamic_calls
    final title = openAiResponse['choices'][1]['message']['content'];

    final chatSessionResponse =
        await supabaseClient.from('chat_sessions').insert({
      'user_id': userId,
      'last_message_content': assistantMessage,
      'title': title,
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
      {'last_message_content': assistantMessage},
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
