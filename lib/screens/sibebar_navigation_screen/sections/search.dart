import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class Search extends AppStatelessWidget {
  const Search({super.key});

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final borderRadius = AppBorderRadius.circular(.5.rem);

    return AppTextField(
      keyboardType: TextInputType.text,
      decoration: AppInputDecoration(
        hintText: "Search",
        hintStyle: Typographies.textMd.withStyles(color: AppColors.gray500),
        prefixIcon: AppIcon(
          icon: AppIcons.search,
          color: AppColors.gray500,
          size: 1.25.rem,
        ),
        border: OutlineInputBorder(
            borderRadius: borderRadius.compute(context, constraints),
            borderSide: const BorderSide(color: AppColors.gray300)),
      ),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return true;
  }
}
