extension AppObject on Object {
  // array contains all the falsy-considered values.
  static const falsy = [false, null, 0, "", double.nan];

  // computes the object's logical (boolean) value.
  static bool toBool(Object? obj) {
    if (falsy.contains(obj)) return false;

    if (obj is Iterable) return obj.isNotEmpty;
    if (obj is Set) return obj.isNotEmpty;
    if (obj is Map) return obj.isNotEmpty;

    return true;
  }

  // computes the logical (boolean) value of each object then performs
  // the xor operation (!=).
  static bool xor(Object? obj1, Object? obj2) {
    return toBool(obj1) != toBool(obj2);
  }

  // computes the logical (boolean) value of each object then performs
  // the and operation (&&).
  static bool and(Object? obj1, Object? obj2) {
    return toBool(obj1) && toBool(obj2);
  }

  // computes the logical (boolean) value of each object then performs
  // the or operation (||).
  static bool or(Object? obj1, Object? obj2) {
    return toBool(obj1) || toBool(obj2);
  }

  // get the logical (boolean) equivalent of this object.
  bool get logical => toBool(this);
}
