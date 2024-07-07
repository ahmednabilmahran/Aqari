import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:flutter/material.dart';
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
              SizedX.h2p5,
              Center(
                child: Text(
                  S.of(context).createNewChatToStartChattingWithAqariAiChat,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
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
          ),
        ),
      ],
    );
  }
}
