// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'dart:async';

import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/controllers/shared_authentication/shared_authentication_cubit.dart';
import 'package:aqari/core/utils/database_manager.dart';
import 'package:aqari/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

/// A [Cubit] that manages the state of the Splash Screen.
///
/// It handles the animations, database initializations, and navigations.
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  /// Retrieves the [SplashCubit] instance from the [BuildContext].
  static SplashCubit get(BuildContext context) => BlocProvider.of(context);

  late AnimationController _firstController;
  late AnimationController _secondController;
  late Animation<double> firstAnimation;
  late Animation<double> secondAnimation;
  late Animation<Color?> colorsAnimation;
  late Timer _timer;

  // Configuration of different time durations for animations and delays.
  final int _firstControllerDuration = 1500;
  final int _secondControllerDuration = 500;
  final int _delayDuration = 500;

  final _colors = <TweenSequenceItem<Color?>>[
    TweenSequenceItem(
      weight: 1,
      tween: ColorTween(
        begin: Theme.of(navigatorKey.currentContext!).primaryColor,
        end: Theme.of(navigatorKey.currentContext!).scaffoldBackgroundColor,
      ),
    ),
    TweenSequenceItem(
      weight: 1,
      tween: ColorTween(begin: Colors.white, end: Colors.white),
    ),
  ];

  DatabaseManager databaseManager = DatabaseManager();

  /// Starts the animations required for the Splash Screen.
  ///
  /// This function sets up and triggers both the first and the second
  /// animations.
  void startAnimation({
    required BuildContext context,
    required TickerProvider vsync,
  }) {
    _initializeControllers(vsync);
    _initializeAnimations();
    _startDelay(context);
    _startFirstAnimation(context);
  }

  /// Initializes animation controllers.
  void _initializeControllers(TickerProvider vsync) {
    _firstController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: _firstControllerDuration),
    );
    _secondController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: _secondControllerDuration),
    );
  }

  /// Initializes animations.
  void _initializeAnimations() {
    firstAnimation = Tween(begin: 0.5, end: 1.0).animate(_firstController);
    colorsAnimation = TweenSequence<Color?>(_colors).animate(_secondController);
    secondAnimation = Tween(begin: 1.4, end: 25.1).animate(_secondController);
  }

  /// Starts the first animation and sets up listeners for transitions.
  void _startFirstAnimation(BuildContext context) {
    _firstController
      ..forward()
      ..addListener(() {
        if (_firstController.isCompleted) {
          _startSecondAnimation();
        }
        emit(SplashStartAnimationState());
      });
  }

  /// Starts the second animation after the first one is completed.
  void _startSecondAnimation() {
    Future.delayed(Duration(milliseconds: _delayDuration), () {
      _secondController
        ..forward()
        ..addListener(() {
          emit(SplashStartAnimationState());
        });
    });
  }

  /// Sets a timer to handle screen transition after the animations.
  void _startDelay(BuildContext context) {
    final delay =
        _firstControllerDuration + _secondControllerDuration + _delayDuration;
    _timer = Timer(Duration(milliseconds: delay), () => _goNext(context));
  }

  /// Transitions to the next screen after the timer delay.
  Future<void> _goNext(BuildContext context) async {
    // Check if the onboarding has already been shown to the user.
    // final onboardingShowed = await databaseManager.getOnBoarding;
    // await Navigator.pushReplacementNamed(context, Routes.loginRoute);

    if (!context.mounted) return;

    // Access the AuthenticationCubit to check the current authentication state.
    final authState = context.read<SharedAuthenticationCubit>().state;
    
    // Decide the next screen based on the authentication state and whether the onboarding was shown.
    if (authState is SharedAuthenticationAuthenticatedState) {
      unawaited(supabaseClient.auth.refreshSession());
      // User is authenticated, navigate to the Home screen.
      await Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.appLayoutRoute,
        (route) => false,
      );
    } else {
      // User is not authenticated, navigate to the Login screen.
      await Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.loginRoute,
        (route) => false,
      );
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    _firstController.dispose();
    _secondController.dispose();
    return super.close();
  }
}
