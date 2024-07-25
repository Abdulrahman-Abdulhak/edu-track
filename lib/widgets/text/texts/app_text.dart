import 'package:flutter/widgets.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/constants/ui/typographies.dart';

import '../addons/app_default_text_style.dart';
import '../addons/app_text_style.dart';

//* this widget is a replacement for the {Text} widget
class AppText extends AppStatelessWidget {
  final String data;

  final AppTextStyle? style;
  final TextOverflow? overflow;
  final int? maxLineCount;

  const AppText(
    this.data, {
    super.key,
    this.style,
    this.overflow,
    this.maxLineCount,
  });

  AppText.regular(
    this.data, {
    super.key,
    this.overflow,
    this.maxLineCount,
    AppTextStyle? style,
  }) : style = AppTextStyle.style(style).merge(Typographies.regular);

  AppText.medium(
    this.data, {
    super.key,
    this.overflow,
    this.maxLineCount,
    AppTextStyle? style,
  }) : style = AppTextStyle.style(style).merge(Typographies.medium);

  AppText.semiBold(
    this.data, {
    super.key,
    this.overflow,
    this.maxLineCount,
    AppTextStyle? style,
  }) : style = AppTextStyle.style(style).merge(Typographies.semiBold);

  //TODO: implement the rich text.
  const AppText.rich(this.data, this.style, this.overflow, this.maxLineCount);

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final defaultStyle = AppDefaultTextStyle.of(context);

    return Text(
      data,
      overflow: overflow ?? defaultStyle.overflow,
      maxLines: maxLineCount ?? defaultStyle.maxLineCount,
      style: (style ?? defaultStyle.style).toTextStyle(context, constraints),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    final fontSize =
        style?.fontSize ?? AppDefaultTextStyle.of(context).style.fontSize!;
    return fontSize.needsConstraints;
  }
}
