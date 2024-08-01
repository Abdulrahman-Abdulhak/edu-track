import 'package:flutter/material.dart';

import './text_transform.dart';
import '../../../_main/main.dart';
import '../../../utils/utils.dart';

//* this class is what defines a new scope for the fontSize to be used for
//* {Em} unit.
class AppDefaultTextStyle extends InheritedTheme {
  final AppTextStyle style;
  final TextOverflow? overflow;
  final TextTransform? textTransform;
  final int? maxLineCount;
  final bool? textWrap;
  final Locale? locale;
  final Color? selectionColor;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextScaler? textScaler;

  AppDefaultTextStyle({
    super.key,
    this.overflow,
    this.textTransform,
    this.maxLineCount,
    this.textWrap,
    this.locale,
    this.selectionColor,
    this.textAlign,
    this.textDirection,
    this.textScaler,
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
      : style = AppTextStyle(
          fontSize: 1.rem,
          fontWeight: FontWeight.w400,
        ).toPixelBased(context, null),
        overflow = TextOverflow.clip,
        textTransform = TextTransform.none,
        maxLineCount = null,
        textWrap = true,
        locale = null,
        selectionColor = null,
        textAlign = TextAlign.start,
        textDirection = null,
        textScaler = null,
        super(child: const _NullWidget());

  static AppDefaultTextStyle of(BuildContext context) {
    final res =
        context.dependOnInheritedWidgetOfExactType<AppDefaultTextStyle>() ??
            AppDefaultTextStyle.fallback(context);
    return res;
  }

  @override
  bool updateShouldNotify(AppDefaultTextStyle oldWidget) {
    return style != oldWidget.style ||
        overflow != oldWidget.overflow ||
        textTransform != oldWidget.textTransform ||
        maxLineCount != oldWidget.maxLineCount;
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
