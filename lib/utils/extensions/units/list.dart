import 'package:flutter/widgets.dart';

import 'package:edu_track/_main/main.dart';

import '../general/general.dart';
import '../../sizes/sizes.dart';

extension AppClassList<T> on List<AppClass<T>> {
  List<T> compute(BuildContext? context, BoxConstraints? constraints) {
    return to((item, i) => item.compute(context, constraints));
  }
}

extension MightAppClassList<T> on List<AppClass<T>?> {
  bool get needsConstraints {
    return any((item) => item != null && item.needsConstraints);
  }

  bool get needsContext {
    return any((item) => item != null && item.needsContext);
  }
}

extension UnitSizeList<T> on List<UnitSize?> {
  bool get needsConstraints {
    return any((size) => size != null && size.needsConstraints);
  }

  bool get needsContext {
    return any((size) => size != null && size.needsContext);
  }

  bool get arePixels {
    return every((size) => size != null && size is Pixel);
  }
}
