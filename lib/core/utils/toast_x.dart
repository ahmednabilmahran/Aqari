import 'dart:async';

import 'package:aqari/main.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// this class is used to show a custom toast
class ToastX {
  static Timer? _toastTimer;
  static OverlayEntry? _overlayEntry;

  /// this method is used to show a custom toast
  static void showCustomToast({
    required String message,
    required BuildContext? context,
  }) {
    final currentContext = navigatorKey.currentContext;
    if (_toastTimer == null || !_toastTimer!.isActive) {
      _overlayEntry = _createOverlayEntry(context ?? currentContext!, message);
      Overlay.of(context ?? currentContext!).insert(_overlayEntry!);
      _toastTimer = Timer(const Duration(milliseconds: 3500), () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
        }
      });
    } else {
      // throw Exception('Toast timer is already running');
    }
  }

  static OverlayEntry _createOverlayEntry(
    BuildContext context,
    String message,
  ) {
    return OverlayEntry(
      builder: (context) => _ToastAnimation(
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              child: Text(
                message,
                textAlign: TextAlign.center,
                maxLines: 4,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).cardColor,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ToastAnimation extends StatefulWidget {
  const _ToastAnimation({required this.child});
  final Widget child;

  @override
  State<_ToastAnimation> createState() => _ToastAnimationState();
}

late AnimationController _animationController1;
late AnimationController _animationController2;
late Animation<double> _fadeAnimation;
late Animation<double> _positionAnimation;

class _ToastAnimationState extends State<_ToastAnimation>
    with TickerProviderStateMixin {
  @override
  void initState() {
    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnimation =
        Tween(begin: -10.0, end: 10.0).animate(_animationController1);
    _positionAnimation =
        Tween(begin: 50.0, end: 100.0).animate(_animationController1);
    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animationController1
      ..forward()
      ..addListener(() {
        setState(() {});
        if (_animationController1.isCompleted) {
          _fadeAnimation =
              Tween(begin: 10.0, end: -10.0).animate(_animationController2);
          _positionAnimation =
              Tween(begin: 100.0, end: 50.0).animate(_animationController2);
          Future.delayed(const Duration(seconds: 2), () {
            _animationController2
              ..forward()
              ..addListener(() {
                setState(() {});
              });
          });
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: _positionAnimation.value,
      width: 50.w,
      left: 25.w,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: widget.child,
      ),
    );
  }
}
