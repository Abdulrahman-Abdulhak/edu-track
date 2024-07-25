import 'package:edu_track/constants/ui/typographies.dart';

import '../../addons/addons.dart';

import '../app_text.dart';

class TextSm extends AppText {
  TextSm(
    super.data, {
    super.key,
    super.overflow,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super(style: AppTextStyle.style(style).merge(Typographies.textSm));

  TextSm.regular(
    super.data, {
    super.key,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super.regular(
          style: AppTextStyle.style(style).merge(Typographies.textSm),
        );

  TextSm.medium(
    super.data, {
    super.key,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super.medium(
          style: AppTextStyle.style(style).merge(Typographies.textSm),
        );

  TextSm.semiBold(
    super.data, {
    super.key,
    super.maxLineCount,
    AppTextStyle? style,
  }) : super.semiBold(
          style: AppTextStyle.style(style).merge(Typographies.textSm),
        );
}
