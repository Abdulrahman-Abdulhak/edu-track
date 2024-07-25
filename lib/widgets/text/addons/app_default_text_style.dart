import 'package:flutter/material.dart';

import 'package:edu_track/utils/extensions/num.dart';

import 'app_text_style.dart';

//* this class is what defines a new scope for the fontSize to be used for
//* {Em} unit.
class AppDefaultTextStyle extends InheritedTheme {
  final AppTextStyle style;
  final TextOverflow? overflow;
  final int? maxLineCount;

  AppDefaultTextStyle({
    super.key,
    this.overflow,
    this.maxLineCount,
    BuildContext? context,
    required AppTextStyle style,
    required super.child,
  })  : assert(
          style.fontSize != null || style.fontSize == null && context != null,
          "AppDefaultTextStyle style.fontSize is null so the context must have a value.",
        ),
        assert(
          style.isPixelBased(),
          "AppDefaultTextStyle style property needs to be in pixel based",
        ),
        style = style.fontSize == null
            ? AppDefaultTextStyle.of(context!).style
            : style;

  AppDefaultTextStyle.fallback(BuildContext context, {super.key})
      : style = AppTextStyle(fontSize: 1.rem).toPixelBased(context, null),
        overflow = TextOverflow.clip,
        maxLineCount = null,
        super(child: const _NullWidget());

  static AppDefaultTextStyle of(BuildContext context) {
    final res =
        context.dependOnInheritedWidgetOfExactType<AppDefaultTextStyle>() ??
            AppDefaultTextStyle.fallback(context);
    return res;
  }

  @override
  bool updateShouldNotify(AppDefaultTextStyle oldWidget) {
    return style != oldWidget.style || overflow != oldWidget.overflow;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AppDefaultTextStyle(
      style: style,
      overflow: overflow,
      child: child,
    );
  }
}

//* this class is used as the fallback child for {AppDefaultTextStyle.fallback}
class _NullWidget extends StatelessWidget {
  const _NullWidget();

  @override
  Widget build(BuildContext context) {
    throw FlutterError(
      'An AppDefaultTextStyle constructed with AppDefaultTextStyle.fallback cannot be incorporated into the widget tree, '
      'it is meant only to provide a fallback value returned by AppDefaultTextStyle.of() '
      'when no enclosing default text style is present in a BuildContext.',
    );
  }
}
