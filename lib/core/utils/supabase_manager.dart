// ignore_for_file: lines_longer_than_80_chars

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A singleton manager class that provides access to the initialized SupabaseClient.
///
/// This class leverages the `@lazySingleton` annotation from the `injectable` package
/// to ensure that there is only one instance of this class throughout the application,
/// instantiated only when first used. It acts as a central point for accessing the
/// SupabaseClient, ensuring that the Supabase initialization is handled cleanly
/// and consistently across the app.
///
/// Usage:
/// Access the SupabaseClient from anywhere in the application by injecting
/// or retrieving the instance of `SupabaseManager` through `get_it` and then
/// accessing the `client` getter.
@lazySingleton
class SupabaseManager {
  /// Getter for accessing the singleton instance of SupabaseClient.
  ///
  /// This property returns the `SupabaseClient` initialized by the `Supabase.initialize`
  /// method, typically called early in the application's lifecycle. It abstracts away
  /// the direct use of `Supabase.instance.client`, providing a more convenient and
  /// testable way of accessing the SupabaseClient throughout the application.
  SupabaseClient get client => Supabase.instance.client;
}
