import 'package:flutter/material.dart';

typedef VoidFunction = void Function();
typedef VoidFunctionBool = void Function(bool);
typedef VoidFunctionString = void Function(String str);

typedef PointerDownEventCallBack = void Function(PointerDownEvent event);

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
