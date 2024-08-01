import 'package:flutter/widgets.dart';

import './main.dart';
import '../utils/utils.dart';

abstract class AppClass<T> {
  static bool anyNeedsContext(List<AppClass?> list) {
    return list.any((item) => item != null && item.needsContext);
  }

  static bool anyNeedsConstraints(List<AppClass?> list) {
    return list.any((item) => item != null && item.needsConstraints);
  }

  static List<T>? computeList<T>(
    List<AppClass<T>>? list,
    BuildContext? context,
    BoxConstraints? constraints,
  ) {
    return list?.to((item) => item.compute(context, constraints));
  }

  static AppClass<Object> fromObject(Object obj) {
    return switch (obj.runtimeType) {
      BorderRadiusGeometry _ => AppBorderRadiusGeometry.fromOrigin(obj),
      BorderSide _ => AppBorderSide.fromOrigin(obj as BorderSide),
      Radius _ => AppRadius.fromOrigin(obj as Radius),
      BoxBorder _ => AppBoxBorder.fromOrigin(obj),
      BoxConstraints _ => AppBoxConstraints.fromOrigin(obj as BoxConstraints),
      BoxDecoration _ => AppBoxDecoration.fromOrigin(obj as BoxDecoration),
      Offset _ => AppOffset.fromOrigin(obj as Offset),
      BoxShadow _ => AppShadow.fromOrigin(obj as BoxShadow),
      Shadow _ => AppShadow.fromOrigin(obj as Shadow),
      Size _ => AppSize.fromOrigin(obj as Size),
      TextStyle _ => AppTextStyle.fromOrigin(obj as TextStyle),
      _ => throw "The object passed isn't of type AppClass<Object>.",
    } as AppClass<Object>;
  }

  static List<AppClass<Object>>? fromList(List<Object>? list) {
    if (list == null) return null;
    return list.to((item) => fromObject(item));
  }

  const AppClass();

  T compute(BuildContext? context, BoxConstraints? constraints);

  bool get needsContext;
  bool get needsConstraints;
}
