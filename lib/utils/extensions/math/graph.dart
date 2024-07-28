import 'package:edu_track/utils/extensions/extensions.dart';

T map<T>(List<T> items, double key, [List<double> keys = const [0, 1]]) {
  assert(keys.length == 2, "key should be able to map between keys");

  final keysToUse = keys.clone()..sort();
  var keyToUse = key.clamp(keysToUse[0], keysToUse[1]);
  keyToUse = (keyToUse + keysToUse[0]) / keysToUse[1];

  var index = keyToUse * items.length;
  var lowerBoundIndex = index.floor();

  var lowerBound = items[lowerBoundIndex];
  if (index == lowerBoundIndex) return lowerBound;

  var upperBound = items[index.ceil()];
  return betweenValues(lowerBound, upperBound, index - lowerBoundIndex);
}

T betweenValues<T>(T lowerBound, T upperBound, double fraction) {
  assert(fraction > 0 && fraction < 1);

  if (lowerBound is num && upperBound is num) {
    return (upperBound - lowerBound) * fraction + lowerBound as T;
  }

  throw "betweenValues math method is not implemented for $T yet";
}
