extension AppMap<T, K> on Map<T, K> {
  //* cast the map to a new type by the callback function.
  Map<L, M> to<L, M>(MapEntry<L, M> Function(T key, K value) callback) {
    final newMap = <L, M>{};

    for (final entry in entries) {
      final newEntry = callback(entry.key, entry.value);
      newMap[newEntry.key] = newEntry.value;
    }

    return newMap;
  }

  //* creates a copy of this map and returns it.
  Map<T, K> clone() => map((key, value) => MapEntry(key, value));

  //* looks up a value in this map.
  K? lookUp(T key) => this[key];
}

extension AppMapNull<T, K> on Map<T, K?> {
  //* removes all null fields from this map.
  Map<T, K> removeNulls() {
    removeWhere((key, value) => value == null);
    return map((key, value) => MapEntry(key, value as K));
  }
}
