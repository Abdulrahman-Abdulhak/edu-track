import 'package:edu_track/constants/ui/typographies.dart';

import '../../addons/addons.dart';

import '../app_text.dart';

class TextLg extends AppText {
  TextLg(
    super.data, {
    super.key,
    super.overflow,
    super.textTransform,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super(style: AppTextStyle.style(style).merge(Typographies.textLg));

  TextLg.regular(
    super.data, {
    super.key,
    super.overflow,
    super.textTransform,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super.regular(
          style: AppTextStyle.style(style).merge(Typographies.textLg),
        );

  TextLg.medium(
    super.data, {
    super.key,
    super.overflow,
    super.textTransform,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super.medium(
          style: AppTextStyle.style(style).merge(Typographies.textLg),
        );

  TextLg.semiBold(
    super.data, {
    super.key,
    super.overflow,
    super.textTransform,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super.semiBold(
          style: AppTextStyle.style(style).merge(Typographies.textLg),
        );
}
