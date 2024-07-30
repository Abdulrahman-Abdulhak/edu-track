import 'package:flutter/widgets.dart';

import 'package:edu_track/_main/main.dart';

import '../general/general.dart';
import '../../sizes/sizes.dart';

extension AppClassList<T> on List<AppClass<T>> {
  List<T> compute(BuildContext? context, BoxConstraints? constraints) {
    return to((item) => item.compute(context, constraints));
  }
}

extension MightAppClassList<T> on List<AppClass<T>?> {
  bool get needsConstraints {
    return AppClass.anyNeedsConstraints(this);
  }

  bool get needsContext {
    return AppClass.anyNeedsContext(this);
  }
}

extension UnitSizeList<T> on List<UnitSize?> {
  bool get needsConstraints {
    return UnitSize.anyNeedsConstraints(this);
  }

  bool get needsContext {
    return UnitSize.anyNeedsContext(this);
  }

  bool get arePixels {
    return every((size) => size != null && size is Pixel);
  }

  bool get arePixelsOrNulls {
    return every((size) => size == null || size is Pixel);
  }
}
