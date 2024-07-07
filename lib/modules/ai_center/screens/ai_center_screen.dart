import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/aqari_app_bar.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/modules/ai_center/widgets/ai_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// AiCenterScreen
class AiCenterScreen extends StatelessWidget {
  /// constructor
  const AiCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AqariAppBar(),
      body: Stack(
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: SvgPicture.asset(
              Assets.genIconsAiCenterBackground,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: CustomPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedX.h3,
                    Text(
                      S.of(context).welcomeToAqaris,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: const Color(0XFF1B1B1B),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                          ),
                    ),
                    Text(
                      S.of(context).aiCenter,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                          ),
                    ),
                    SizedX.h4,
                    AiOptionCard(
                      title: S.of(context).chat,
                      description:
                          S.of(context).ourPersonalAiAssistantIsReadyToHelpYou,
                      image: Assets.genImagesAiChatBot,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.aiChatRoute,
                        );
                      },
                    ),
                    SizedX.h2,
                    AiOptionCard(
                      title: S.of(context).selects,
                      description: S
                          .of(context)
                          .ourAiRecommendationSystemIsTailoredToFindThePerfect,
                      image: Assets.genImagesAiRecommendationSystem,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
