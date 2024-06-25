import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/main.dart';
import 'package:aqari/modules/ai_center/controllers/get_all_chats/get_all_chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

/// [NoMessagesWidget]
class NoMessagesWidget extends StatelessWidget {
  /// constructor
  const NoMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedX.h1,
        Text(
          S.of(context).aiChats,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 27.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        SizedBox(
          height: 72.5.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.genIconsNoChats,
                height: 10.h,
                width: 10.w,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor.withOpacity(1),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 3.h),
              Center(
                child: Text(
                  "You don't have any conversations yet",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        letterSpacing: 0,
                      ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              SizedX.h3,
              CustomButton(
                onPressed: () {
                  context
                      .read<GetAllChatsCubit>()
                      .getAllChats(supabaseClient.auth.currentUser!.id);
                },
                buttonText: S.of(context).searchAgain,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
