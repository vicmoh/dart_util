extension ListExtension<E> on List {
  /// Sort and return the list.
  /// The [compareCallback] is a function the compares
  /// two objects. Returns 0 it it is a match,
  /// else one object is greater than the other.
  List<E> sortBy(int Function(E, E) compareCallback) {
    List<E> sorted = [];
    sorted.sort(compareCallback);
    return sorted;
  }
}
