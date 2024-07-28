import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/_main/main.dart';

import '../app_text.dart';

class TextDisplayXs extends AppText {
  TextDisplayXs(
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
  }) : super(style: AppTextStyle.copy(style).merge(Typographies.displayXs));

  TextDisplayXs.regular(
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
          style: AppTextStyle.copy(style).merge(Typographies.displayXs),
        );

  TextDisplayXs.medium(
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
          style: AppTextStyle.copy(style).merge(Typographies.displayXs),
        );

  TextDisplayXs.semiBold(
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
          style: AppTextStyle.copy(style).merge(Typographies.displayXs),
        );
}
