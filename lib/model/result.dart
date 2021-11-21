
class Result<T>{
  Result._();
  factory Result.success(T value) = SuccessState<T>;
  factory Result.failure(int code, String msg) = FailureState<T>;
}

class SuccessState<T> extends Result<T> {
  final T value;
  SuccessState(this.value) : super._();
}

class FailureState<T> extends Result<T> {
  final int code;
  final String msg;
  FailureState(this.code, this.msg): super._();
}
