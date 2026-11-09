sealed class FireBaseResult<T> {}

class FireBaseSuccess<T> extends FireBaseResult<T> {
  final T data;
  FireBaseSuccess(this.data);
}

class FireBaseError<T> extends FireBaseResult<T> {
  final String message;
  FireBaseError(this.message);
}
