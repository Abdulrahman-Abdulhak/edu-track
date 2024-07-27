import 'package:edu_track/constants/ui/typographies.dart';

import '../../addons/addons.dart';

import '../app_text.dart';

class TextMd extends AppText {
  TextMd(
    super.data, {
    super.key,
    super.overflow,
    super.maxLineCount,
    super.textTransform,
    super.semanticsLabel,
    super.textWrap,
    super.locale,
    super.selectionColor,
    super.textAlign,
    super.textDirection,
    super.textScaler,
    AppTextStyle? style,
  }) : super(style: AppTextStyle.style(style).merge(Typographies.textMd));

  TextMd.regular(
    super.data, {
    super.key,
    super.overflow,
    super.maxLineCount,
    super.textTransform,
    super.semanticsLabel,
    super.textWrap,
    super.locale,
    super.selectionColor,
    super.textAlign,
    super.textDirection,
    super.textScaler,
    AppTextStyle? style,
  }) : super.regular(
          style: AppTextStyle.style(style).merge(Typographies.textMd),
        );

  TextMd.medium(
    super.data, {
    super.key,
    super.overflow,
    super.maxLineCount,
    super.textTransform,
    super.semanticsLabel,
    super.textWrap,
    super.locale,
    super.selectionColor,
    super.textAlign,
    super.textDirection,
    super.textScaler,
    AppTextStyle? style,
  }) : super.medium(
          style: AppTextStyle.style(style).merge(Typographies.textMd),
        );

  TextMd.semiBold(
    super.data, {
    super.key,
    super.overflow,
    super.maxLineCount,
    super.textTransform,
    super.semanticsLabel,
    super.textWrap,
    super.locale,
    super.selectionColor,
    super.textAlign,
    super.textDirection,
    super.textScaler,
    AppTextStyle? style,
  }) : super.semiBold(
          style: AppTextStyle.style(style).merge(Typographies.textMd),
        );
}
