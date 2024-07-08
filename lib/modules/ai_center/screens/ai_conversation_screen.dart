import 'dart:developer';

import 'package:aqari/apis/chat_api.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/main.dart';
import 'package:aqari/models/chat_message_model.dart';
import 'package:aqari/models/chat_session_model.dart';
import 'package:aqari/modules/ai_center/controllers/create_new_chat/create_new_chat_cubit.dart';
import 'package:aqari/modules/ai_center/controllers/get_messages/get_messages_cubit.dart';
import 'package:aqari/modules/ai_center/controllers/send_message/send_message_cubit.dart';
import 'package:aqari/modules/ai_center/widgets/chat_shimmer_loading.dart';
import 'package:aqari/modules/ai_center/widgets/message_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// AiConversationScreen
class AiConversationScreen extends StatefulWidget {
  /// MainAiChatScreen constructor
  const AiConversationScreen({
    this.chatSession,
    this.isNewChat = false,
    super.key,
  });

  /// [chatSession]
  final ChatSession? chatSession;

  /// [isNewChat]
  final bool isNewChat;

  @override
  // ignore: library_private_types_in_public_api
  _AiConversationScreenState createState() => _AiConversationScreenState();
}

class _AiConversationScreenState extends State<AiConversationScreen> {
  ChatSession? _currentChatSession;
  GetMessagesCubit? _getMessagesCubit;

  @override
  void initState() {
    super.initState();
    _currentChatSession = widget.chatSession;
    if (_currentChatSession != null) {
      _initializeGetMessagesCubit(_currentChatSession!.sessionId);
    }
  }

  void _initializeGetMessagesCubit(int sessionId) {
    _getMessagesCubit = GetMessagesCubit(getIt<ChatApi>(), sessionId);
    _getMessagesCubit!.getAllMessages();
  }

  @override
  void dispose() {
    _getMessagesCubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        if (_currentChatSession != null && _getMessagesCubit != null)
          BlocProvider.value(
            value: _getMessagesCubit!,
          ),
        BlocProvider(
          create: (context) => SendMessageCubit(
            getIt<ChatApi>(),
          ),
        ),
        if (widget.isNewChat)
          BlocProvider(
            create: (context) => CreateNewChatCubit(
              getIt<ChatApi>(),
            ),
          ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: _currentChatSession?.title ?? S.of(context).newChat,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BlocBuilder<SendMessageCubit, void>(
          builder: (context, state) {
            return BottomAppBar(
              elevation: 0,
              notchMargin: 0,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: CustomTextField(
                      onTapOutside: (_) {},
                      hintText: S.of(context).startTyping,
                      controller:
                          context.read<SendMessageCubit>().messageController,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeHelper.appColors.black.withOpacity(0.4),
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  SizedX.w2,
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (widget.isNewChat && _currentChatSession == null) {
                          createNewChatSession(context);
                        } else {
                          sendMessageOnTab(context);
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(11.sp),
                          child: SvgPicture.asset(
                            Assets.genIconsSendMessage,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: _currentChatSession == null
                      ? BlocConsumer<CreateNewChatCubit, CreateNewChatState>(
                          listener: (context, state) {
                            if (state is CreateNewChatError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.error),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else if (state is CreateNewChatSuccess) {
                              setState(() {
                                _currentChatSession = state.chatSession;
                                _initializeGetMessagesCubit(
                                  _currentChatSession!.sessionId,
                                );
                              });
                            }
                          },
                          builder: (context, state) {
                            if (state is CreateNewChatLoading) {
                              return chatShimmerLoading();
                            } else if (state is CreateNewChatSuccess) {
                              return SingleChildScrollView(
                                reverse: true,
                                child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.messages.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedX.h1p5;
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final message = state.messages[index];

                                    return Column(
                                      children: [
                                        MessageContainer(chatMessage: message),
                                        if (index == state.messages.length - 1)
                                          SizedX.h10,
                                      ],
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.genIconsNewAiChat,
                                    height: 8.h,
                                    width: 8.w,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(1),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  SizedX.h2p5,
                                  Center(
                                    child: Text(
                                      S
                                          .of(context)
                                          // ignore: lines_longer_than_80_chars
                                          .chatWithAqariAiChatToGetYourQuestionsAnswered,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.sp,
                                            height: 0.17.h,
                                            letterSpacing: 0,
                                          ),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        )
                      : BlocBuilder<GetMessagesCubit, GetMessagesState>(
                          builder: (context, state) {
                            if (state is GetMessagesSuccessState &&
                                state.messages.isNotEmpty) {
                              return SingleChildScrollView(
                                reverse: true,
                                child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: context
                                      .read<GetMessagesCubit>()
                                      .messageList
                                      .length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedX.h1p5;
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final message = context
                                        .read<GetMessagesCubit>()
                                        .messageList[index];

                                    return Column(
                                      children: [
                                        MessageContainer(chatMessage: message),
                                        if (index ==
                                            context
                                                    .read<GetMessagesCubit>()
                                                    .messageList
                                                    .length -
                                                1)
                                          SizedX.h10,
                                      ],
                                    );
                                  },
                                ),
                              );
                            } else if (state is GetMessagesLoadingState &&
                                context
                                    .read<GetMessagesCubit>()
                                    .messageList
                                    .isEmpty) {
                              return chatShimmerLoading();
                            } else if (state is GetMessagesErrorState) {
                              return Center(
                                child: CustomButton(
                                  onPressed: () {
                                    context
                                        .read<GetMessagesCubit>()
                                        .getAllMessages();
                                  },
                                  buttonText: S.of(context).retry,
                                ),
                              );
                            } else {
                              return const Center(
                                child: Text('No messages yet'),
                              );
                            }
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createNewChatSession(BuildContext context) async {
    if (context.read<SendMessageCubit>().messageController.text.isNotEmpty) {
      await context.read<CreateNewChatCubit>().createChatSession(
            supabaseClient.auth.currentUser!.id,
            context.read<SendMessageCubit>().messageController.text,
          );

      if (context.mounted) {
        context.read<SendMessageCubit>().messageController.clear();
      }
    }
  }

  Future<void> sendMessageOnTab(BuildContext context) async {
    final messageController =
        context.read<SendMessageCubit>().messageController;
    if (messageController.text.isNotEmpty) {
      final userMessage = messageController.text;

      // Generate a unique messageId and get the current timestamp
      final userMessageId = DateTime.now().millisecondsSinceEpoch;
      final timestamp =
          DateTime.now().toUtc().subtract(const Duration(hours: 3));
      log(timestamp.toString());

      // Add user's message to the chat immediately
      context.read<GetMessagesCubit>().addMessage(
            ChatMessage(
              messageId: userMessageId,
              sessionId: _currentChatSession!.sessionId,
              sender: 'user',
              message: userMessage,
              createdAt: timestamp,
            ),
          );

      // Clear the text field
      messageController.clear();

      // Generate a unique messageId for the loading placeholder
      final loadingMessageId = userMessageId + 1;

      // Add a loading placeholder for the assistant's response
      final loadingMessage = ChatMessage(
        messageId: loadingMessageId,
        sessionId: _currentChatSession!.sessionId,
        sender: 'assistant',
        message: '...',
        createdAt: timestamp,
      );
      context.read<GetMessagesCubit>().addMessage(loadingMessage);

      // Send the message to the backend
      try {
        // ignore: lines_longer_than_80_chars
        final assistantMessage =
            await context.read<SendMessageCubit>().sendMessage(
                  message: userMessage,
                  sessionId: _currentChatSession!.sessionId,
                );

        // Update the loading message with the actual response
        // ignore: use_build_context_synchronously
        context.read<GetMessagesCubit>().updateMessage(
              loadingMessage,
              assistantMessage,
            );
      } catch (e) {
        // Handle error
        // ignore: use_build_context_synchronously
        context.read<GetMessagesCubit>().removeMessage(loadingMessage);
        SnackX.showSnackBar(message: 'Failed to send message: $e');
      }
    }
  }
}
