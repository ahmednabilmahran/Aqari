import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/extensions.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/models/chat_session_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// [MessageOverviewRow]
class MessageOverviewRow extends StatelessWidget {
  /// [MessageOverviewRow] constructor
  const MessageOverviewRow({
    required this.chatSession,
    super.key,
  });

  /// [chatSession]
  final ChatSession chatSession;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.aiConversationRoute,
          arguments: [chatSession, false],
        );
      },
      child: Row(
        children: [
          // Container(
          //   width: 20.w,
          //   height: 20.w,
          //   alignment: Alignment.center,
          //   decoration: const BoxDecoration(
          //     color: Colors.grey, // Update with your theme color
          //     shape: BoxShape.circle,
          //   ),
          //   child: Text(
          //     chatSession.title.substring(0, 2).toUpperCase(),
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Colors.white, // Update with your theme color
          //         ),
          //   ),
          // ),
          // SizedBox(width: 2.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatSession.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                        letterSpacing: 0,
                      ),
                ),
                SizedX.h0p5,
                Text(
                  chatSession.lastMessageContent,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.grey.withOpacity(0.9),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                // Add status if needed
              ],
            ),
          ),
          SizedX.w4,
          Row(
            children: [
              Text(
                chatSession.lastMessageDate
                    .toLocal()
                    .add(const Duration(hours: 3))
                    .toCustomChatAndNotificationsDate,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                      fontSize: 9.sp,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
