/// Base Failure class for error handling in the application.
///
/// This abstract class is designed to encapsulate error messages
/// arising from various operations within the application, providing
/// a consistent structure for error management across different layers
/// of the application architecture.
library;
// ignore_for_file: lines_longer_than_80_chars

/// Base Failure class for error handling in the application.
abstract class Failure {
  /// Constructs a [Failure] instance with an error message.
  const Failure(this.message);

  /// The error message associated with the failure.
  final String message;
}

/// Represents failures due to server-side issues.
///
/// This class is used to handle errors that originate from interactions
/// with remote servers, such as HTTP errors, server downtime, or any
/// backend-related exceptions.
class ServerFailure extends Failure {
  /// Constructs a [ServerFailure] instance with an error message.
  const ServerFailure(super.message);
}

/// Represents failures due to connection issues, such as no internet connection.
///
/// This class is intended for handling errors related to network connectivity,
/// enabling the application to provide feedback to the user regarding their
/// current network status and the requirement of an active connection.
class ConnectionFailure extends Failure {
  /// Constructs a [ConnectionFailure] instance with an error message.
  const ConnectionFailure(super.message);
}

/// Represents failures during the authentication process.
///
/// This class encapsulates errors that occur during user authentication,
/// including but not limited to login failures, token expiration, or
/// unauthorized access attempts.
class AuthFailure extends Failure {
  /// Constructs an [AuthFailure] instance with an error message.
  const AuthFailure(super.message);
}

/// Represents generic failures for unexpected errors.
///
/// This catch-all failure class is used for encapsulating exceptions
/// that do not fit into the more specific failure categories defined
/// within the application, such as runtime exceptions or unclassified errors.
class GenericFailure extends Failure {
  /// Constructs a [GenericFailure] instance with an error message.
  const GenericFailure(super.message);
}

/// Represents failures related to local data cache issues.
///
/// This class is specifically designed for errors encountered during
/// operations involving local data caching, such as reading from or
/// writing to local storage, cache invalidation, or data corruption.
class CacheFailure extends Failure {
  /// Constructs a [CacheFailure] instance with an error message.
  const CacheFailure(super.message);
}

/// Represents failures related to input validation, such as form submissions.
///
/// This class handles errors arising from user input validation processes,
/// ensuring that invalid data is not processed and providing feedback for
/// correction.
class ValidationFailure extends Failure {
  /// Constructs a [ValidationFailure] instance with an error message.
  const ValidationFailure(super.message);
}

/// Represents failures due to operations being canceled, e.g., by the user.
///
/// This class is used to handle scenarios where an operation is intentionally
/// canceled by the user or due to external factors, allowing for graceful
/// termination and feedback.
class CancellationFailure extends Failure {
  /// Constructs a [CancellationFailure] instance with an error message.
  const CancellationFailure(super.message);
}

/// Represents failures for feature-specific issues, possibly unique to the application.
///
/// This class is intended for encapsulating errors that are specific to certain
/// features or components within the application, providing a means to handle
/// these specialized cases distinctly.
class FeatureFailure extends Failure {
  /// Constructs a [FeatureFailure] instance with an error message.
  const FeatureFailure(super.message);
}

// Note: Add more specific failure classes as needed for your application.
