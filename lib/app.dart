import 'package:aqari/config/routes/app_pages.dart';
import 'package:aqari/config/themes/app_theme.dart';
import 'package:aqari/config/themes/app_theme_dark.dart';
import 'package:aqari/core/controllers/shared_authentication/shared_authentication_cubit.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/utils/app_strings.dart';
import 'package:aqari/core/utils/no_glow.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/main.dart';
import 'package:aqari/modules/splash/domain/usecases/change_lang.dart';
import 'package:aqari/modules/splash/domain/usecases/change_theme_mode.dart';
import 'package:aqari/modules/splash/domain/usecases/get_saved_lang.dart';
import 'package:aqari/modules/splash/domain/usecases/get_saved_theme_mode.dart';
import 'package:aqari/modules/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

/// The root widget of the application.
class AqariApp extends StatelessWidget {
  /// Construct the application.
  const AqariApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(
            getIt<GetSavedLangUseCase>(),
            getIt<ChangeLangUseCase>(),
            getIt<GetSavedThemeModeUseCase>(),
            getIt<ChangeThemeModeUseCase>(),
          )
            ..getSavedLang()
            ..getSavedThemeMode(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<SharedAuthenticationCubit>()..checkAuthenticationStatus(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => NoGlowScroll(
          child: MaterialApp(
            // navigatorObservers: [AnalyticsNavigatorObserver()],
            navigatorKey: navigatorKey,
            title: AppStrings.appName,
            locale: Locale(MainCubit.get(context).currentLangCode),
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme(
              MainCubit.get(context).currentLangCode,
            ),
            darkTheme: AppThemeDark.theme(
              MainCubit.get(context).currentLangCode,
            ),
            themeMode: MainCubit.get(context).currentThemeMode,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        ),
      ),
    );
  }
}
