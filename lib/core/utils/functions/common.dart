extension Common<T> on T {
  R let<R>(R Function(T) transform) => transform(this);

  T? takeIf(bool Function() predicate) => predicate() ? this : null;
}
