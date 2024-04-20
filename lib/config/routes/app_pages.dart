import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/app_strings.dart';
import 'package:aqari/modules/login/screens/login_screen.dart';
import 'package:aqari/modules/sign_up/screens/sign_up_screen.dart';
import 'package:aqari/modules/splash/presentation/screens/splash_screen.dart';
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
