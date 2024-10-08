import 'dart:ui';

import 'package:aqari/app.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/utils/bloc_observer.dart';
import 'package:aqari/core/utils/countries_helper.dart';
import 'package:aqari/core/utils/database_manager.dart';
import 'package:aqari/core/utils/local_notification_helper.dart';
import 'package:aqari/core/utils/supabase_manager.dart';
import 'package:aqari/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A global key that will uniquely identify the Navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// The [SupabaseClient] instance that is used to interact with Supabase.
final supabaseClient = getIt<SupabaseManager>().client;

Future<void> main() async {
  // Ensures that widget-binding is initialized.
  // This is required because plugins might be called before runApp.
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Supabase.
  await Supabase.initialize(
    // TODO(Nabil): Remote Config
    url: 'https://bcnpuratdoebreqvwioc.supabase.co',
    anonKey:
        // TODO(Nabil): Remote Config
        // ignore: lines_longer_than_80_chars
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJjbnB1cmF0ZG9lYnJlcXZ3aW9jIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcxNzczNzQ0OCwiZXhwIjoyMDMzMzEzNDQ4fQ.on3bb4-yVjIjc2eKmny6ELD5z7BQfnZjZiC8Zuyo2WA',
  );

  // Asynchronously initialize dependencies and the Hive database.
  await Future.wait([
    configureDependencies(),
    DatabaseManager.initHive(),
    CountriesHelper.loadCountriesData(),
    LocalNotificationService().initializeSettings(),
  ]);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // ignore: lines_longer_than_80_chars
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Set the global Bloc observer for better debugging and logging.
  Bloc.observer = AppBlocObserver();

  runApp(const AqariApp());
}
