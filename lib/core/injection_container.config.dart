// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../apis/login_api.dart' as _i5;
import '../apis/sign_up_api.dart' as _i6;
import '../modules/splash/data/datasources/splash_local_datasource.dart' as _i7;
import '../modules/splash/data/repositories/splash_repo_impl.dart' as _i9;
import '../modules/splash/domain/repositories/splash_repo.dart' as _i8;
import '../modules/splash/domain/usecases/change_lang.dart' as _i12;
import '../modules/splash/domain/usecases/change_theme_mode.dart' as _i13;
import '../modules/splash/domain/usecases/get_saved_lang.dart' as _i10;
import '../modules/splash/domain/usecases/get_saved_theme_mode.dart' as _i11;
import 'utils/database_manager.dart' as _i4;
import 'utils/supabase_manager.dart' as _i3;

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
    gh.lazySingleton<_i3.SupabaseManager>(() => _i3.SupabaseManager());
    gh.lazySingleton<_i4.DatabaseManager>(() => _i4.DatabaseManager());
    gh.lazySingleton<_i5.LoginApi>(() => _i5.LoginApi());
    gh.lazySingleton<_i6.SignUpApi>(() => _i6.SignUpApi());
    gh.lazySingleton<_i7.SplashLocalDataSource>(
        () => _i7.SplashLocalDataSourceImpl());
    gh.lazySingleton<_i8.SplashRepo>(() => _i9.SplashRepoImpl(
        splashLocalDataSource: gh<_i7.SplashLocalDataSource>()));
    gh.lazySingleton<_i10.GetSavedLangUseCase>(
        () => _i10.GetSavedLangUseCase(splashRepo: gh<_i8.SplashRepo>()));
    gh.lazySingleton<_i11.GetSavedThemeModeUseCase>(
        () => _i11.GetSavedThemeModeUseCase(splashRepo: gh<_i8.SplashRepo>()));
    gh.lazySingleton<_i12.ChangeLangUseCase>(
        () => _i12.ChangeLangUseCase(splashRepo: gh<_i8.SplashRepo>()));
    gh.lazySingleton<_i13.ChangeThemeModeUseCase>(
        () => _i13.ChangeThemeModeUseCase(splashRepo: gh<_i8.SplashRepo>()));
    return this;
  }
}
