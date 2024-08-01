import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class TextMd extends AppText {
  TextMd(
    super.data, {
    super.key,
    super.color,
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
  }) : super(style: AppTextStyle.copy(style).merge(Typographies.textMd));

  TextMd.regular(
    super.data, {
    super.key,
    super.color,
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
          style: AppTextStyle.copy(style).merge(Typographies.textMd),
        );

  TextMd.medium(
    super.data, {
    super.key,
    super.color,
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
          style: AppTextStyle.copy(style).merge(Typographies.textMd),
        );

  TextMd.semiBold(
    super.data, {
    super.key,
    super.color,
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
          style: AppTextStyle.copy(style).merge(Typographies.textMd),
        );
}
