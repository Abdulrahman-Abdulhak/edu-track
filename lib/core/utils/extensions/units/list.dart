import 'package:flutter/widgets.dart';

import '../general/general.dart';
import '../../sizes/sizes.dart';
import '../../../_main/main.dart';

extension AppClassList<T> on List<AppClass<T>> {
  List<R> compute<R>(BuildContext context, BoxConstraints? constraints) {
    return AppClass.computeList(this, context, constraints)!.to(
      (item) => item as R,
    );
  }
}

extension MightAppClassList<T> on List<AppClass<T>?> {
  bool needsConstraints(BuildContext context) {
    return AppClass.anyNeedsConstraints(this, context);
  }

  bool get needsContext {
    return AppClass.anyNeedsContext(this);
  }
}

extension MightWidgetList<T> on List<AppStatelessWidget?> {
  bool needsConstraints(BuildContext context) {
    return AppClass.anyNeedsConstraints(this, context);
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
