import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/main.dart';
import 'package:aqari/models/chat_session_model.dart';
import 'package:aqari/modules/ai_center/controllers/get_all_chats/get_all_chats_cubit.dart';
import 'package:aqari/modules/ai_center/widgets/message_overview_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// [MessagesList]
class MessagesList extends StatefulWidget {
  /// [MessagesList] constructor
  const MessagesList({
    required this.chatSessions,
    super.key,
  });

  /// [chatSessions]
  final List<ChatSession> chatSessions;

  @override
  // ignore: library_private_types_in_public_api
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToTop();
    });
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent + 30);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<GetAllChatsCubit>().chatList.clear();
        await context.read<GetAllChatsCubit>().getAllChats(
              supabaseClient.auth.currentUser!.id,
            );
      },
      child: ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        reverse: true,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        itemCount: widget.chatSessions.length,
        padding: EdgeInsets.only(bottom: 10.h),
        separatorBuilder: (context, index) {
          return SizedX.h2;
        },
        itemBuilder: (context, index) {
          return MessageOverviewRow(
            chatSession: widget.chatSessions[index],
          );
        },
      ),
    );
  }
}
