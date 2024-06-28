import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/app_strings.dart';
import 'package:aqari/models/chat_session_model.dart';
import 'package:aqari/modules/ai_center/screens/main_ai_chat/main_ai_chat_screen.dart';
import 'package:aqari/modules/app_layout/screens/app_layout_screen.dart';
import 'package:aqari/modules/login/screens/login_screen.dart';
import 'package:aqari/modules/notifications/screens/notification_screen.dart';
import 'package:aqari/modules/profile/screens/setting_screen.dart';
import 'package:aqari/modules/sign_up/screens/sign_up_screen.dart';
import 'package:aqari/modules/splash/presentation/screens/splash_screen.dart';
import 'package:aqari/modules/verify_sign_up/screens/verify_sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/profile/screens/change_password.dart';
import '../../modules/profile/screens/edit_profile.dart';

/// Application routes
class AppRoutes {
  /// this method is used to generate the routes
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
          settings: const RouteSettings(name: Routes.initialRoute),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
          settings: const RouteSettings(name: Routes.loginRoute),
        );

      case Routes.signUpRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SignUpScreen();
          },
          settings: const RouteSettings(name: Routes.signUpRoute),
        );

      case Routes.verifySignUpRoute:
        return MaterialPageRoute(
          builder: (context) {
            return VerifySignUpScreen(
              usingEmail: routeSettings.arguments! as bool,
            );
          },
          settings: const RouteSettings(name: Routes.verifySignUpRoute),
        );

      case Routes.appLayoutRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const AppLayoutScreen();
          },
          settings: const RouteSettings(name: Routes.appLayoutRoute),
        );

      case Routes.notificationsRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const NotificationsScreen();
          },
          settings: const RouteSettings(name: Routes.notificationsRoute),
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SettingScreen();
          },
          settings: const RouteSettings(name: Routes.settingScreen),
        );
      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (context) {
            return const EditProfile();
          },
          settings: const RouteSettings(name: Routes.editProfile),
        );
      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (context) {
            return const ChangePassword();
          },
          settings: const RouteSettings(name: Routes.changePassword),
        );

      case Routes.chatRoute:
        return MaterialPageRoute(
          builder: (context) {
            final args = routeSettings.arguments! as List;

            return MainAiChatScreen(
              chatSession: args[0] as ChatSession?,
              isNewChat: args[1] as bool,
            );
          },
          settings: const RouteSettings(name: Routes.chatRoute),
        );

      default:
        return undefinedRoute();
    }
  }

  /// this method is used to undefinedRoute the routes
  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('undefinedRoute'),
        ),
      ),
      settings: const RouteSettings(name: AppStrings.noRouteFound),
    );
  }
}
