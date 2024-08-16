import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UploadFile extends StatelessWidget {
  const UploadFile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: AppEdgeInsets.symmetric(vertical: 1.rem, horizontal: 1.5.rem),
      decoration: AppBoxDecoration(
        borderRadius: AppBorderRadius.all(
          AppRadius.circular(.5.rem),
        ),
        border: AppBorder.all(color: AppColors.gray200),
      ),
      child: AppColumn(
        children: [
          AppIcon(
            icon: AppIcons.uploadCloud,
            color: AppColors.brand700,
            size: 1.25.rem,
          ),
          AppRow(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                backgroundColor: Colors.transparent,
                onPressed: () {},
                child: TextSm.semiBold(
                  'Click to upload',
                  color: AppColors.brand700,
                ),
              ),
              TextSm.regular('or drag and drop'),
            ],
          ),
          TextXs.regular('PDF, DOC, ZIP or .RAR (max. 120 MB)')
        ],
      ),
    );
  }
}
