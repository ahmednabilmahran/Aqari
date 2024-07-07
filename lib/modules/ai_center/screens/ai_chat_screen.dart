import 'package:aqari/apis/chat_api.dart';
import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/utils/snack_x.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/main.dart';
import 'package:aqari/modules/ai_center/controllers/get_all_chats/get_all_chats_cubit.dart';
import 'package:aqari/modules/ai_center/widgets/message_shimmer_list_view_item.dart';
import 'package:aqari/modules/ai_center/widgets/messages_list.dart';
import 'package:aqari/modules/ai_center/widgets/no_messages_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// AiChatScreen
class AiChatScreen extends StatelessWidget {
  /// constructor
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllChatsCubit(
        getIt<ChatApi>(),
      )..getAllChats(supabaseClient.auth.currentUser!.id),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: const Color(0XFFF9F9F9),
        floatingActionButton: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.aiConversationRoute,
              arguments: [null, true],
            );
          },
          child: Container(
            width: 40.w,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.75.h,
                horizontal: 4.w,
              ),
              child: Row(
                children: [
                  Text(
                    S.of(context).newText,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          letterSpacing: 0,
                        ),
                  ),
                  SizedX.w1,
                  SizedX.w0p5,
                  SvgPicture.asset(
                    Assets.genIconsNewAiChat,
                    height: 3.5.h,
                    width: 3.5.w,
                  ),
                  SizedX.w1,
                  SizedX.w0p5,
                  Text(
                    S.of(context).chat,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          letterSpacing: 0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: CustomAppBar(titleText: S.of(context).aiChats),
        body: SafeArea(
          child: CustomPadding(
            child: BlocConsumer<GetAllChatsCubit, GetAllChatsState>(
              listener: (context, state) {
                if (state is GetAllChatsErrorState) {
                  SnackX.showSnackBar(
                    message: state.error,
                    context: context,
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<GetAllChatsCubit>();
                if ((State is GetAllChatsLoadingState &&
                        cubit.chatList.isNotEmpty) ||
                    (state is GetAllChatsSuccessState &&
                        cubit.chatList.isNotEmpty)) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedX.h1,
                      Expanded(
                        child: MessagesList(
                          chatSessions: cubit.chatList,
                        ),
                      ),
                    ],
                  );
                } else if (state is GetAllChatsSuccessState &&
                    cubit.chatList.isEmpty) {
                  return const NoMessagesWidget();
                } else if (state is GetAllChatsErrorState) {
                  return Center(
                    child: CustomButton(
                      onPressed: () {
                        cubit.getAllChats(supabaseClient.auth.currentUser!.id);
                      },
                      buttonText: S.of(context).retry,
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedX.h1,
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          padding: EdgeInsets.only(bottom: 10.h),
                          separatorBuilder: (context, index) {
                            return SizedX.h4;
                          },
                          itemBuilder: (context, index) {
                            return const MessageShimmerListViewItem();
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
