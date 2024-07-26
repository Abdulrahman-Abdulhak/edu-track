import 'package:edu_track/constants/ui/typographies.dart';

import '../../addons/addons.dart';

import '../app_text.dart';

class TextXs extends AppText {
  TextXs(
    super.data, {
    super.key,
    super.overflow,
    super.textTransform,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super(style: AppTextStyle.style(style).merge(Typographies.textXs));

  TextXs.regular(
    super.data, {
    super.key,
    super.overflow,
    super.textTransform,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super.regular(
          style: AppTextStyle.style(style).merge(Typographies.textXs),
        );

  TextXs.medium(
    super.data, {
    super.key,
    super.overflow,
    super.textTransform,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super.medium(
          style: AppTextStyle.style(style).merge(Typographies.textXs),
        );

  TextXs.semiBold(
    super.data, {
    super.key,
    super.overflow,
    super.textTransform,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super.semiBold(
          style: AppTextStyle.style(style).merge(Typographies.textXs),
        );
}
