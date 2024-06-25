import 'package:aqari/apis/chat_api.dart';
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
  Future<void> sendMessage({
    required String message,
    required int sessionId,
  }) async {
    try {
      await _chatApi.sendMessage(
        sessionId,
        message,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
