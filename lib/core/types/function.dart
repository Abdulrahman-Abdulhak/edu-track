import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../_main/main.dart';

typedef VoidFunction = void Function();
typedef VoidFunctionBool = void Function(bool);
typedef VoidFunctionString = void Function(String str);
typedef StringFunction = String Function(String str);

typedef PointerDownEventCallBack = void Function(PointerDownEvent event);

typedef TextErrorCheckCallBack = bool Function(String text);

typedef InputCounterWidgetBuilder = Widget? Function(
  BuildContext context, {
  required int currentLength,
  required int? maxLength,
  required bool isFocused,
});
typedef EditableTextContextMenuBuilder = Widget Function(
  BuildContext context,
  EditableTextState editableTextState,
);
typedef AppPrivateCommandCallback = void Function(
  String action,
  Map<String, dynamic> data,
);

typedef MaybeConstrainedWidgetBuilder = Widget Function(
  BuildContext context,
  BoxConstraints? constraints,
);

// router types
typedef AppHeaderNavBuilder = AppPreferredSizeWidget Function(
  BuildContext context,
  TabsRouter tabsRouter,
);
