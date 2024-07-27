import 'package:edu_track/constants/ui/typographies.dart';

import '../../addons/addons.dart';

import '../app_text.dart';

class TextDisplaySm extends AppText {
  TextDisplaySm(
    super.data, {
    super.key,
    super.overflow,
    super.maxLineCount,
    super.textTransform,
    AppTextStyle? style,
  }) : super(style: AppTextStyle.style(style).merge(Typographies.displaySm));

  TextDisplaySm.regular(
    super.data, {
    super.key,
    super.overflow,
    super.maxLineCount,
    super.textTransform,
    AppTextStyle? style,
  }) : super.regular(
          style: AppTextStyle.style(style).merge(Typographies.displaySm),
        );

  TextDisplaySm.medium(
    super.data, {
    super.key,
    super.overflow,
    super.maxLineCount,
    super.textTransform,
    AppTextStyle? style,
  }) : super.medium(
          style: AppTextStyle.style(style).merge(Typographies.displaySm),
        );

  TextDisplaySm.semiBold(
    super.data, {
    super.key,
    super.overflow,
    super.maxLineCount,
    super.textTransform,
    AppTextStyle? style,
  }) : super.semiBold(
          style: AppTextStyle.style(style).merge(Typographies.displaySm),
        );
}
