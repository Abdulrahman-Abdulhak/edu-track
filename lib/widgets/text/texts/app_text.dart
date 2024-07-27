import 'package:edu_track/utils/extensions/extensions.dart';
import 'package:edu_track/widgets/text/addons/text_transform.dart';
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
  final String? semanticsLabel;
  final bool? textWrap;
  final Locale? locale;
  final Color? selectionColor;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextScaler? textScaler;

  final TextTransform textTransform;

  const AppText(
    this.data, {
    super.key,
    this.style,
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
  }) : style = AppTextStyle.style(style).merge(Typographies.regular);

  AppText.medium(
    this.data, {
    super.key,
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
  }) : style = AppTextStyle.style(style).merge(Typographies.medium);

  AppText.semiBold(
    this.data, {
    super.key,
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
  }) : style = AppTextStyle.style(style).merge(Typographies.semiBold);

  //TODO: implement the rich text.
  const AppText.rich(
    this.data,
    this.style,
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

    final dataToUse = switch (textTransform) {
      TextTransform.sentenceCapitalize => data.capitalizeSentence(),
      TextTransform.capitalize => data.capitalizeWord(),
      TextTransform.uppercase => data.toUpperCase(),
      TextTransform.lowercase => data.toLowerCase(),
      TextTransform.none => data,
    };

    return Text(
      dataToUse,
      locale: locale ?? defaultStyle.locale,
      selectionColor: selectionColor ?? defaultStyle.selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: textWrap ?? defaultStyle.textWrap,
      textAlign: textAlign ?? defaultStyle.textAlign,
      textDirection: textDirection ?? defaultStyle.textDirection,
      textScaler: textScaler ?? defaultStyle.textScaler,
      overflow: overflow ?? defaultStyle.overflow,
      maxLines: maxLineCount ?? defaultStyle.maxLineCount,
      style: (style ?? defaultStyle.style).compute(context, constraints),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    final fontSize =
        style?.fontSize ?? AppDefaultTextStyle.of(context).style.fontSize;
    return fontSize?.needsConstraints ?? false;
  }
}
