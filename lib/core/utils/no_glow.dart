import 'package:flutter/material.dart';

/// this class is the no glow scroll
class NoGlowScroll extends StatelessWidget {
  /// constructor
  const NoGlowScroll({required this.child, super.key});

  /// child of the no glow scroll
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: child,
    );
  }
}
