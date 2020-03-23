extension MapExtension<K, V> on Map<K, V> {
  /// Convert a map to a list of object.
  /// Takes a [callback] of each key and value where it returns
  /// the list of conversion types.
  List<T> mapToList<T>(T Function(K key, V value) callback) {
    List<T> listOfConversion = [];
    for (var each in this.entries)
      listOfConversion.add(callback(each.key, each.value));
    return listOfConversion;
  }
}
