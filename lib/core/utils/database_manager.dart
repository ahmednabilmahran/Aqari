import 'package:aqari/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

/// An enum for the data boxes used in the database.
enum DataBoxes {
  /// The settings box.
  settings,
}

/// An enum for the keys used in the database.
enum Keys {
  /// The preferred language key.
  language,

  /// The preferred theme mode key.
  themeMode,

  /// The onboarding showed key.
  onboardingShowed,
}

/// A class for managing local database operations.
///
/// It uses the [Hive] library to perform operations such as setting and
/// retrieving the preferred language and theme mode.
@lazySingleton
class DatabaseManager {
  /// Initializes [Hive] for local database management.
  static Future<dynamic> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(DataBoxes.settings.name);
  }

  /// Sets the preferred language code in the database.
  void setLanguage(String languageCode) {
    Hive.box<dynamic>(DataBoxes.settings.name)
        .put(Keys.language.name, languageCode);
  }

  /// Retrieves the preferred language code from the database.
  Future<String> getLanguage() async {
    final box = Hive.box<dynamic>(DataBoxes.settings.name);
    final langCode = box.get(Keys.language.name);
    return Future.value(
      (langCode as String?) == null ? AppStrings.englishCode : langCode,
    );
  }

  /// Sets the preferred theme mode in the database.
  void setThemeMode(String themeMode) {
    Hive.box<dynamic>(DataBoxes.settings.name)
        .put(Keys.themeMode.name, themeMode);
  }

  /// Retrieves the preferred theme mode from the database.
  Future<String> getThemeMode() async {
    final box = Hive.box<dynamic>(DataBoxes.settings.name);
    final themeMode = box.get(Keys.themeMode.name);
    return Future.value(
      (themeMode as String?) == null ? ThemeMode.system.name : themeMode,
    );
  }

  /// set that the user has seen the onboarding screen
  void get setOnBoarding {
    Hive.box<dynamic>(DataBoxes.settings.name)
        .put(Keys.onboardingShowed.name, true);
  }

  /// get that the user has seen the onBoarding screen
  Future<bool> get getOnBoarding async {
    final box = Hive.box<dynamic>(DataBoxes.settings.name);
    final isOnBoarding = (box.get(Keys.onboardingShowed.name) ?? false) as bool;
    return Future.value(isOnBoarding);
  }

  /// Clears all data from the database.
  ///
  /// Note: This method is intended for debugging purposes only.
  static Future<void> clearData() async {
    await Hive.box<dynamic>(DataBoxes.settings.name).clear();
  }
}
