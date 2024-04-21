import 'package:aqari/app.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/utils/bloc_observer.dart';
import 'package:aqari/core/utils/countries_helper.dart';
import 'package:aqari/core/utils/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A global key that will uniquely identify the Navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // Ensures that widget-binding is initialized.
  // This is required because plugins might be called before runApp.
  WidgetsFlutterBinding.ensureInitialized();

  // Asynchronously initialize dependencies and the Hive database.
  await Future.wait([
    configureDependencies(),
    DatabaseManager.initHive(),
    CountriesHelper.loadCountriesData(),
  ]);

  // Set the global Bloc observer for better debugging and logging.
  Bloc.observer = AppBlocObserver();

  runApp(const AqariApp());
}
