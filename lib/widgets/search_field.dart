import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class SearchField extends StatelessWidget {
  final AppTextStyle? style;
  final AppInputDecoration? decoration;
  final AppInputBorder? border;
  final VoidFunctionString? onChange;
  final VoidFunction? filterAction;

  final AppEdgeInsetsGeometry contentPadding;
  final Widget prefixIcon;
  final String hintText;

  final VoidFunctionString onSubmit;

  const SearchField({
    super.key,
    this.style,
    this.decoration,
    this.border,
    this.onChange,
    this.filterAction,
    this.hintText = "Search",
    this.prefixIcon = const AppIcon(
      icon: AppIcons.search,
      color: AppColors.gray500,
      size: Rem(1.25),
    ),
    this.contentPadding = const AppEdgeInsets.symmetric(
      vertical: Rem(.625),
      horizontal: Rem(.875),
    ),
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      keyboardType: TextInputType.text,
      onChange: onChange,
      onSubmit: onSubmit,
      decoration: decoration ??
          AppInputDecoration(
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle: Typographies.textMd
                .withStyles(color: AppColors.gray500)
                .withStyle(style),
            prefixIcon: prefixIcon,
            suffixIcon: filterAction != null
                ? AppIconButton(
                    onPressed: filterAction!,
                    icon: AppIcons.filtersLines,
                    color: AppColors.gray500,
                    size: 1.5.rem,
                  )
                : null,
            border: border ??
                AppOutlineInputBorder(
                  borderRadius: AppBorderRadius.circular(.5.rem),
                  borderSide: const AppBorderSide(color: AppColors.gray300),
                ),
          ),
    );
  }
}
