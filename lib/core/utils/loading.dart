import 'dart:ui';

import 'package:aqari/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

/// this class is to show the loading dialog
Future<dynamic> loading(BuildContext dialogContext) {
  return showDialog(
    context: dialogContext,
    builder: (context) => const DefaultLoading(),
    barrierDismissible: false,
    useSafeArea: false,
  );
}

/// this class is to show the default loading dialog
class DefaultLoading extends StatelessWidget {
  /// constructor
  const DefaultLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        color: Colors.white.withOpacity(0.4),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Center(
            child: Lottie.asset(
              Assets.genLottieLoading,
              width: 15.h,
              height: 15.h,
            ),
          ),
        ),
      ),
    );
  }
}
