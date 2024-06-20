import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

/// VerifySignUpScreen
class VerifySignUpScreen extends StatefulWidget {
  /// constructor
  const VerifySignUpScreen({required this.usingEmail, super.key});

  /// usingEmail
  final bool usingEmail;

  @override
  // ignore: library_private_types_in_public_api
  _VerifySignUpScreenState createState() => _VerifySignUpScreenState();
}

class _VerifySignUpScreenState extends State<VerifySignUpScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 4));
    _confettiController.play();

    Future.delayed(const Duration(seconds: 5), () {
      // Replace 'NextScreen' with the screen you want to navigate to
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.appLayoutRoute,
        (route) => false,
      );
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  widget.usingEmail
                      ? Assets.genIconsVerifySignUp
                      : Assets.genIconsDone,
                  height: 10.5.h,
                  width: 10.5.w,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                SizedX.h1,
                Text(
                  widget.usingEmail
                      ? S.of(context).youreAlmostInFinalStep
                      : S.of(context).youreAllSet,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor.withOpacity(1),
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedX.h0p5,
                Text(
                  widget.usingEmail
                      ? S.of(context).weNeedToConfirmYourAccount
                      : S.of(context).youCanStartUsingTheAppRightAway,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 11.25.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).hintColor.withOpacity(1),
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedX.h3,
                if (widget.usingEmail)
                  Text(
                    S.of(context).youWillReceiveAnEmailOnceAccepted,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                    textAlign: TextAlign.center,
                  )
                else
                  const SizedBox(),
              ],
            ),
          ),
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            minBlastForce: 20,
            maxBlastForce: 60,
            numberOfParticles: 30,
            blastDirection: 45,
            shouldLoop: true,
            colors: [
              Theme.of(context).primaryColor,
              const Color(0XFF1b1b1b),
              const Color(0XFFf4f4f4),
              const Color(0XFF47515D),
            ],
          ),
        ],
      ),
    );
  }
}
