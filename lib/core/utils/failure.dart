import 'dart:io';

sealed class Failure {

  final Exception? cause;

  Failure(this.cause);

  static Failure analyzeCause(Exception? cause) {
    if (cause is StateError) {
      return ApplicationException(cause.toString(), cause);
    } else if (cause is SocketException || cause is HttpException) {
      return NetworkConnection(cause);
    } else {
      if (cause != null) {
        print(cause);
      }
      return UnknownException(cause);
    }
  }

}

class ApplicationException extends Failure {
  final String message;

  ApplicationException(this.message, Exception? cause) : super(cause);
}

class UnknownException extends Failure {
  UnknownException(Exception? cause) : super(cause);
}

class NetworkConnection extends Failure {
  NetworkConnection(Exception? cause) : super(cause);
}

class ServerError extends Failure {
  final int code;

  ServerError(this.code, Exception? cause) : super(cause);
}

extension FailureAnalysis on Failure {

  String toText() {
    switch(this) {
      case ApplicationException():
        return 'Application Error: ${cause.toString()}';
      case UnknownException():
        return 'Unknown Error: ${cause.toString()}';
      case NetworkConnection():
        return 'Network Error: ${cause.toString()}';
      case ServerError():
        return 'Server Error (Code: ${(this as ServerError).code}): ${cause.toString()}';
    }
  }
}

extension ExceptionToFailure on Exception {
  Failure toFailure() => Failure.analyzeCause(this);
}
