import 'failure.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;
  Error(this.failure);
}

extension ResultExtensions<T> on Result<T> {
  void onSuccess(void Function(T data) action) {
    if (this is Success<T>) {
      action((this as Success<T>).data);
    }
  }

  void onFailure(void Function(Failure failure) action) {
    if (this is Error<T>) {
      action((this as Error<T>).failure);
    }
  }

  U when<U>(U Function(T data) onSuccess, U Function(Failure failure) onFailure) {
    if (this is Success<T>) {
      return onSuccess((this as Success<T>).data);
    } else {
      return onFailure((this as Error<T>).failure);
    }
  }

  Result<U> map<U>(U Function(T data) mapper) {
    if (this is Success<T>) {
      return Success(mapper((this as Success<T>).data));
    } else {
      return this as Result<U>;
    }
  }
}

extension ExceptionToError on Exception {
  Error<T> toResultError<T>() => Error<T>(toFailure());
}

