import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/app_strings.dart';
import 'package:aqari/models/chat_session_model.dart';
import 'package:aqari/modules/ai_center/screens/main_ai_chat/main_ai_chat_screen.dart';
import 'package:aqari/modules/app_layout/screens/app_layout_screen.dart';
import 'package:aqari/modules/identity_verification/screens/identity_verification_screen.dart';
import 'package:aqari/modules/login/screens/login_screen.dart';
import 'package:aqari/modules/notifications/screens/notification_screen.dart';
import 'package:aqari/modules/profile/screens/about_us.dart';
import 'package:aqari/modules/profile/screens/change_password.dart';
import 'package:aqari/modules/profile/screens/edit_profile.dart';
import 'package:aqari/modules/profile/screens/setting_screen.dart';
import 'package:aqari/modules/profile/screens/terms_conditions.dart';
import 'package:aqari/modules/sell_my_property/controllers/unit_details/unit_details_cubit.dart';
import 'package:aqari/modules/sell_my_property/screens/getting_started_screen.dart';
import 'package:aqari/modules/sell_my_property/screens/unit_address_details_screen.dart';
import 'package:aqari/modules/sell_my_property/screens/unit_details_screen.dart';
import 'package:aqari/modules/sell_my_property/screens/unit_gallery_details_screen.dart';
import 'package:aqari/modules/sell_my_property/screens/unit_price_details_screen.dart';
import 'package:aqari/modules/sign_up/screens/sign_up_screen.dart';
import 'package:aqari/modules/splash/presentation/screens/splash_screen.dart';
import 'package:aqari/modules/verify_sign_up/screens/verify_sign_up_screen.dart';
import 'package:flutter/material.dart';

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

      case Routes.termsAndConditions:
        return MaterialPageRoute(
          builder: (context) {
            return const TermsAndConditionsScreen();
          },
          settings: const RouteSettings(name: Routes.termsAndConditions),
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
      case Routes.aboutUs:
        return MaterialPageRoute(
          builder: (context) {
            return const AboutUs();
          },
          settings: const RouteSettings(name: Routes.aboutUs),
        );

      case Routes.identityVerification:
        return MaterialPageRoute(
          builder: (context) {
            return const IdentityVerificationScreen();
          },
          settings: const RouteSettings(name: Routes.identityVerification),
        );

      case Routes.gettingStarted:
        return MaterialPageRoute(
          builder: (context) {
            return const GettingStartedScreen();
          },
          settings: const RouteSettings(name: Routes.gettingStarted),
        );

      case Routes.unitDetails:
        return MaterialPageRoute(
          builder: (context) {
            return UnitDetailsScreen();
          },
          settings: const RouteSettings(name: Routes.unitDetails),
        );

      case Routes.unitAddressDetails:
        return MaterialPageRoute(
          builder: (context) {
            return UnitAddressDetailsScreen(
              unitDetailsCubit: routeSettings.arguments! as UnitDetailsCubit,
            );
          },
          settings: const RouteSettings(name: Routes.unitAddressDetails),
        );

      case Routes.unitGalleryDetails:
        return MaterialPageRoute(
          builder: (context) {
            return UnitGalleryDetailsScreen(
              unitDetailsCubit: routeSettings.arguments! as UnitDetailsCubit,
            );
          },
          settings: const RouteSettings(name: Routes.unitAddressDetails),
        );

      case Routes.unitPriceDetails:
        return MaterialPageRoute(
          builder: (context) {
            return UnitPriceDetailsScreen(
              unitDetailsCubit: routeSettings.arguments! as UnitDetailsCubit,
            );
          },
          settings: const RouteSettings(name: Routes.unitPriceDetails),
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
