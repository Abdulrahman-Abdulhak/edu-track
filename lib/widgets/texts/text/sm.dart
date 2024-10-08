import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class TextSm extends AppText {
  TextSm(
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
  }) : super(style: AppTextStyle.copy(style).merge(Typographies.textSm));

  TextSm.regular(
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
          style: AppTextStyle.copy(style).merge(Typographies.textSm),
        );

  TextSm.medium(
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
          style: AppTextStyle.copy(style).merge(Typographies.textSm),
        );

  TextSm.semiBold(
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
          style: AppTextStyle.copy(style).merge(Typographies.textSm),
        );
}
