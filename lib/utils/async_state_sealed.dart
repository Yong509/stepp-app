sealed class AsyncState<T> {
  const AsyncState._();

  factory AsyncState.loading() => const LoadingState();
  factory AsyncState.success(T data) => SuccessState(data);
  factory AsyncState.error(T exception) => ErrorState(exception);
}

class LoadingState<T> extends AsyncState<T> {
  const LoadingState() : super._();
}

class SuccessState<T> extends AsyncState<T> {
  final T data;
  const SuccessState(this.data) : super._();
}

class ErrorState<T> extends AsyncState<T> {
  final T exception;
  const ErrorState(this.exception) : super._();
}
