// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../apis/chat_api.dart' as _i5;
import '../apis/login_api.dart' as _i3;
import '../apis/recommendation_api.dart' as _i4;
import '../apis/sign_up_api.dart' as _i6;
import '../modules/splash/data/datasources/splash_local_datasource.dart'
    as _i10;
import '../modules/splash/data/repositories/splash_repo_impl.dart' as _i12;
import '../modules/splash/domain/repositories/splash_repo.dart' as _i11;
import '../modules/splash/domain/usecases/change_lang.dart' as _i15;
import '../modules/splash/domain/usecases/change_theme_mode.dart' as _i16;
import '../modules/splash/domain/usecases/get_saved_lang.dart' as _i13;
import '../modules/splash/domain/usecases/get_saved_theme_mode.dart' as _i14;
import 'controllers/shared_authentication/shared_authentication_cubit.dart'
    as _i9;
import 'utils/database_manager.dart' as _i8;
import 'utils/supabase_manager.dart' as _i7;

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
    gh.lazySingleton<_i4.RecommendationApi>(() => _i4.RecommendationApi());
    gh.lazySingleton<_i5.ChatApi>(() => _i5.ChatApi());
    gh.lazySingleton<_i6.SignUpApi>(() => _i6.SignUpApi());
    gh.lazySingleton<_i7.SupabaseManager>(() => _i7.SupabaseManager());
    gh.lazySingleton<_i8.DatabaseManager>(() => _i8.DatabaseManager());
    gh.lazySingleton<_i9.SharedAuthenticationCubit>(
        () => _i9.SharedAuthenticationCubit());
    gh.lazySingleton<_i10.SplashLocalDataSource>(
        () => _i10.SplashLocalDataSourceImpl());
    gh.lazySingleton<_i11.SplashRepo>(() => _i12.SplashRepoImpl(
        splashLocalDataSource: gh<_i10.SplashLocalDataSource>()));
    gh.lazySingleton<_i13.GetSavedLangUseCase>(
        () => _i13.GetSavedLangUseCase(splashRepo: gh<_i11.SplashRepo>()));
    gh.lazySingleton<_i14.GetSavedThemeModeUseCase>(
        () => _i14.GetSavedThemeModeUseCase(splashRepo: gh<_i11.SplashRepo>()));
    gh.lazySingleton<_i15.ChangeLangUseCase>(
        () => _i15.ChangeLangUseCase(splashRepo: gh<_i11.SplashRepo>()));
    gh.lazySingleton<_i16.ChangeThemeModeUseCase>(
        () => _i16.ChangeThemeModeUseCase(splashRepo: gh<_i11.SplashRepo>()));
    return this;
  }
}
