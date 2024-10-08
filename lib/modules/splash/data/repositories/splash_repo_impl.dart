import 'package:aqari/core/errors/failures.dart';
import 'package:aqari/core/utils/app_strings.dart';
import 'package:aqari/modules/splash/data/datasources/splash_local_datasource.dart';
import 'package:aqari/modules/splash/domain/repositories/splash_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// [SplashRepoImpl] is the concrete implementation
/// of the [SplashRepo] interface.
///
/// It interacts with a local data source
/// to get and set language and theme settings.
@LazySingleton(as: SplashRepo)
class SplashRepoImpl implements SplashRepo {
  /// Constructor that initializes the local data source for splash settings.
  SplashRepoImpl({
    required this.splashLocalDataSource,
  });

  /// Local data source for interacting with splash settings.
  final SplashLocalDataSource splashLocalDataSource;

  /// Changes the application's language.
  ///
  /// Returns a [Failure] if there's an exception, otherwise returns true.
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await splashLocalDataSource.changeLang(langCode: langCode);
      return right(langIsChanged);
    } catch (e) {
      return left(const ServerFailure(AppStrings.cacheFailure));
    }
  }

  /// Retrieves the saved application language from local storage.
  ///
  /// Returns a [Failure] if there's an exception,
  /// otherwise returns the language code.
  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await splashLocalDataSource.getSavedLang();
      return right(langCode);
    } catch (e) {
      return left(const ServerFailure(AppStrings.cacheFailure));
    }
  }

  /// Changes the application's theme mode.
  ///
  /// Returns a [Failure] if there's an exception, otherwise returns true.
  @override
  Future<Either<Failure, bool>> changeThemeMode({
    required String themeMode,
  }) async {
    try {
      final themeModeIsChanged =
          await splashLocalDataSource.changeThemeMode(themeMode: themeMode);
      return right(themeModeIsChanged);
    } catch (e) {
      return left(const ServerFailure(AppStrings.cacheFailure));
    }
  }

  /// Retrieves the saved application theme mode from local storage.
  ///
  /// Returns a [Failure] if there's an exception,
  /// otherwise returns the theme mode.
  @override
  Future<Either<Failure, String>> getSavedThemeMode() async {
    try {
      final themeMode = await splashLocalDataSource.getSavedThemeMode();
      return right(themeMode);
    } catch (e) {
      return left(const ServerFailure(AppStrings.cacheFailure));
    }
  }
}
