import 'package:aqari/core/utils/shimmer_loading.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/models/chat_message_model.dart';
import 'package:aqari/modules/ai_center/widgets/message_container.dart';
import 'package:flutter/material.dart';

/// chat shimmer loading
Widget chatShimmerLoading() {
  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 50,
    separatorBuilder: (BuildContext context, int index) {
      return SizedX.h1p5;
    },
    itemBuilder: (BuildContext context, int index) {
      final isMe = index.isEven;
      return ShimmerLoading(
        child: MessageContainer(
          chatMessage: ChatMessage(
            message: 'This is a message',
            sender: isMe ? 'user' : 'ai',
            messageId: 1,
            sessionId: 1,
            createdAt: DateTime.now(),
          ),
        ),
      );
    },
  );
}
