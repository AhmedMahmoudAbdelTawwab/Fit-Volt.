sealed class FireBaseResult<T> {}

class success<T> extends FireBaseResult<T> {
  final T data;
  success(this.data);
}

class failure<T> extends FireBaseResult<T> {
  final String message;
  failure(this.message);
}
