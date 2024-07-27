import 'package:edu_track/constants/ui/typographies.dart';

import '../../addons/addons.dart';

import '../app_text.dart';

class TextDisplayXs extends AppText {
  TextDisplayXs(
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
  }) : super(style: AppTextStyle.style(style).merge(Typographies.displayXs));

  TextDisplayXs.regular(
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
          style: AppTextStyle.style(style).merge(Typographies.displayXs),
        );

  TextDisplayXs.medium(
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
          style: AppTextStyle.style(style).merge(Typographies.displayXs),
        );

  TextDisplayXs.semiBold(
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
          style: AppTextStyle.style(style).merge(Typographies.displayXs),
        );
}
