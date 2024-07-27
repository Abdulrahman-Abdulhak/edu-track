import 'package:edu_track/_main/border/app_border_radius.dart';
import 'package:edu_track/_main/widget/app_stateless_widget.dart';
import 'package:edu_track/constants/ui/colors.dart';
import 'package:edu_track/constants/ui/typographies.dart';
import 'package:edu_track/utils/extensions/extensions.dart';
import 'package:edu_track/widgets/icons/app_icon.dart';
import 'package:edu_track/widgets/input/addons/app_input_decoration.dart';
import 'package:edu_track/widgets/input/text_field.dart';
import 'package:flutter/material.dart';

class Search extends AppStatelessWidget {
  const Search({super.key});

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final borderRadius = AppBorderRadius.all(.5.rem);

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
