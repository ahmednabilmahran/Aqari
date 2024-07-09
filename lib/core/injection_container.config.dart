// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../apis/chat_api.dart' as _i6;
import '../apis/login_api.dart' as _i3;
import '../apis/notifications_api.dart' as _i11;
import '../apis/recommendation_api.dart' as _i5;
import '../apis/sign_up_api.dart' as _i7;
import '../apis/units_api.dart' as _i4;
import '../modules/notifications/controllers/notifications_cubit.dart' as _i13;
import '../modules/splash/data/datasources/splash_local_datasource.dart'
    as _i12;
import '../modules/splash/data/repositories/splash_repo_impl.dart' as _i15;
import '../modules/splash/domain/repositories/splash_repo.dart' as _i14;
import '../modules/splash/domain/usecases/change_lang.dart' as _i18;
import '../modules/splash/domain/usecases/change_theme_mode.dart' as _i19;
import '../modules/splash/domain/usecases/get_saved_lang.dart' as _i16;
import '../modules/splash/domain/usecases/get_saved_theme_mode.dart' as _i17;
import 'controllers/shared_authentication/shared_authentication_cubit.dart'
    as _i10;
import 'utils/database_manager.dart' as _i9;
import 'utils/supabase_manager.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.LoginApi>(() => _i3.LoginApi());
    gh.lazySingleton<_i4.UnitsApi>(() => _i4.UnitsApi());
    gh.lazySingleton<_i5.RecommendationApi>(() => _i5.RecommendationApi());
    gh.lazySingleton<_i6.ChatApi>(() => _i6.ChatApi());
    gh.lazySingleton<_i7.SignUpApi>(() => _i7.SignUpApi());
    gh.lazySingleton<_i8.SupabaseManager>(() => _i8.SupabaseManager());
    gh.lazySingleton<_i9.DatabaseManager>(() => _i9.DatabaseManager());
    gh.lazySingleton<_i10.SharedAuthenticationCubit>(
        () => _i10.SharedAuthenticationCubit());
    gh.lazySingleton<_i11.NotificationsApi>(() => _i11.NotificationsApi());
    gh.lazySingleton<_i12.SplashLocalDataSource>(
        () => _i12.SplashLocalDataSourceImpl());
    gh.factory<_i13.NotificationsCubit>(
        () => _i13.NotificationsCubit(gh<_i11.NotificationsApi>()));
    gh.lazySingleton<_i14.SplashRepo>(() => _i15.SplashRepoImpl(
        splashLocalDataSource: gh<_i12.SplashLocalDataSource>()));
    gh.lazySingleton<_i16.GetSavedLangUseCase>(
        () => _i16.GetSavedLangUseCase(splashRepo: gh<_i14.SplashRepo>()));
    gh.lazySingleton<_i17.GetSavedThemeModeUseCase>(
        () => _i17.GetSavedThemeModeUseCase(splashRepo: gh<_i14.SplashRepo>()));
    gh.lazySingleton<_i18.ChangeLangUseCase>(
        () => _i18.ChangeLangUseCase(splashRepo: gh<_i14.SplashRepo>()));
    gh.lazySingleton<_i19.ChangeThemeModeUseCase>(
        () => _i19.ChangeThemeModeUseCase(splashRepo: gh<_i14.SplashRepo>()));
    return this;
  }
}
