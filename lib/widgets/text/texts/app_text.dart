import 'package:flutter/widgets.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/constants/constants.dart';

import '../addons/addons.dart';

//* this widget is a replacement for the {Text} widget
class AppText extends AppStatelessWidget {
  final AppTextStyle? style;
  final TextOverflow? overflow;
  final int? maxLineCount;
  final String? semanticsLabel;
  final bool? textWrap;
  final Locale? locale;
  final Color? color, selectionColor;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextScaler? textScaler;

  final TextTransform textTransform;

  final Object data;

  const AppText(
    this.data, {
    super.key,
    this.style,
    this.color,
    this.overflow,
    this.maxLineCount,
    this.semanticsLabel,
    this.textWrap,
    this.locale,
    this.selectionColor,
    this.textAlign,
    this.textDirection,
    this.textScaler,
    this.textTransform = TextTransform.sentenceCapitalize,
  });

  AppText.regular(
    this.data, {
    super.key,
    this.color,
    this.overflow,
    this.maxLineCount,
    this.semanticsLabel,
    this.textWrap,
    this.locale,
    this.selectionColor,
    this.textAlign,
    this.textDirection,
    this.textScaler,
    AppTextStyle? style,
    this.textTransform = TextTransform.sentenceCapitalize,
  }) : style = AppTextStyle.copy(style).merge(Typographies.regular);

  AppText.medium(
    this.data, {
    super.key,
    this.color,
    this.overflow,
    this.maxLineCount,
    this.semanticsLabel,
    this.textWrap,
    this.locale,
    this.selectionColor,
    this.textAlign,
    this.textDirection,
    this.textScaler,
    AppTextStyle? style,
    this.textTransform = TextTransform.sentenceCapitalize,
  }) : style = AppTextStyle.copy(style).merge(Typographies.medium);

  AppText.semiBold(
    this.data, {
    super.key,
    this.color,
    this.overflow,
    this.maxLineCount,
    this.semanticsLabel,
    this.textWrap,
    this.locale,
    this.selectionColor,
    this.textAlign,
    this.textDirection,
    this.textScaler,
    AppTextStyle? style,
    this.textTransform = TextTransform.sentenceCapitalize,
  }) : style = AppTextStyle.copy(style).merge(Typographies.semiBold);

  //TODO: implement the rich text.
  const AppText.rich(
    this.data,
    this.style,
    this.color,
    this.overflow,
    this.maxLineCount,
    this.semanticsLabel,
    this.textWrap,
    this.locale,
    this.selectionColor,
    this.textAlign,
    this.textDirection,
    this.textScaler, [
    this.textTransform = TextTransform.sentenceCapitalize,
  ]);

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final defaultStyle = AppDefaultTextStyle.of(context);
    final styleToUse = (style ?? defaultStyle.style).withStyles(color: color);

    final dataToUse = switch (textTransform) {
      TextTransform.sentenceCapitalize => data.toString().capitalizeSentence(),
      TextTransform.capitalize => data.toString().capitalizeWord(),
      TextTransform.uppercase => data.toString().toUpperCase(),
      TextTransform.lowercase => data.toString().toLowerCase(),
      TextTransform.none => data.toString(),
    };

    return Text(
      dataToUse,
      style: styleToUse.compute(context, constraints),
      locale: locale ?? defaultStyle.locale,
      selectionColor: selectionColor ?? defaultStyle.selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: textWrap ?? defaultStyle.textWrap,
      textAlign: textAlign ?? defaultStyle.textAlign,
      textDirection: textDirection ?? defaultStyle.textDirection,
      textScaler: textScaler ?? defaultStyle.textScaler,
      overflow: overflow ?? defaultStyle.overflow,
      maxLines: maxLineCount ?? defaultStyle.maxLineCount,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    final style = this.style ?? AppDefaultTextStyle.of(context).style;
    return [style].needsConstraints;
  }
}
