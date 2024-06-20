// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../apis/login_api.dart' as _i3;
import '../apis/sign_up_api.dart' as _i4;
import '../modules/splash/data/datasources/splash_local_datasource.dart' as _i8;
import '../modules/splash/data/repositories/splash_repo_impl.dart' as _i10;
import '../modules/splash/domain/repositories/splash_repo.dart' as _i9;
import '../modules/splash/domain/usecases/change_lang.dart' as _i13;
import '../modules/splash/domain/usecases/change_theme_mode.dart' as _i14;
import '../modules/splash/domain/usecases/get_saved_lang.dart' as _i11;
import '../modules/splash/domain/usecases/get_saved_theme_mode.dart' as _i12;
import 'controllers/shared_authentication/shared_authentication_cubit.dart'
    as _i7;
import 'utils/database_manager.dart' as _i6;
import 'utils/supabase_manager.dart' as _i5;

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
    gh.lazySingleton<_i4.SignUpApi>(() => _i4.SignUpApi());
    gh.lazySingleton<_i5.SupabaseManager>(() => _i5.SupabaseManager());
    gh.lazySingleton<_i6.DatabaseManager>(() => _i6.DatabaseManager());
    gh.lazySingleton<_i7.SharedAuthenticationCubit>(
        () => _i7.SharedAuthenticationCubit());
    gh.lazySingleton<_i8.SplashLocalDataSource>(
        () => _i8.SplashLocalDataSourceImpl());
    gh.lazySingleton<_i9.SplashRepo>(() => _i10.SplashRepoImpl(
        splashLocalDataSource: gh<_i8.SplashLocalDataSource>()));
    gh.lazySingleton<_i11.GetSavedLangUseCase>(
        () => _i11.GetSavedLangUseCase(splashRepo: gh<_i9.SplashRepo>()));
    gh.lazySingleton<_i12.GetSavedThemeModeUseCase>(
        () => _i12.GetSavedThemeModeUseCase(splashRepo: gh<_i9.SplashRepo>()));
    gh.lazySingleton<_i13.ChangeLangUseCase>(
        () => _i13.ChangeLangUseCase(splashRepo: gh<_i9.SplashRepo>()));
    gh.lazySingleton<_i14.ChangeThemeModeUseCase>(
        () => _i14.ChangeThemeModeUseCase(splashRepo: gh<_i9.SplashRepo>()));
    return this;
  }
}
