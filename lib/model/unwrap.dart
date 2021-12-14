

class Unwrap<T> {
  T? value;
  Unwrap(T? value) {
    this.value = value;
  }

  T or(T defaultValue) {
    var value = this.value;
    if (value != null) {
      return value;
    } else {
      return defaultValue;
    }
  }
}

