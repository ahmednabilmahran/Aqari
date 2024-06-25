import 'package:aqari/core/utils/extensions.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// [MessageContainer]
class MessageContainer extends StatelessWidget {
  /// [MessageContainer] constructor
  const MessageContainer({
    required this.chatMessage,
    super.key,
  });

  /// [chatMessage] to store the message
  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          chatMessage.sender == 'user' ? Alignment.topRight : Alignment.topLeft,
      child: IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
            color: chatMessage.sender == 'user'
                ? ThemeHelper.appColors.senderContainer
                : ThemeHelper.appColors.receiverContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints(
            minWidth: 5.w,
            maxWidth: 75.w,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chatMessage.message,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        height: 0.15.h,
                        color: ThemeHelper.appColors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedX.h1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (chatMessage.sender != 'user')
                      Text(
                        'AI Assistant • ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.3),
                              fontSize: 9.sp,
                            ),
                      )
                    else
                      SizedX.zero,
                    Text(
                      chatMessage.createdAt
                          .toLocal()
                          .toCustomChatAndNotificationsDate,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).hintColor.withOpacity(0.3),
                            fontSize: 9.sp,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
