extension ListExt<T> on List<T> {
  List<R> mapReversed<R>(R Function(T) convert) =>
      this.reversed.map(convert).toList();
}
