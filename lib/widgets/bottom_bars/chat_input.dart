import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

// FIXME: fix the maxHeight constraints problem.
class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: [
        const AppDivider(color: AppColors.gray300),
        AppTextField(
          onSubmit: (str) {
            // TODO: implement.
          },
          decoration: AppInputDecoration(
            hintText: "Message",
            hintStyle: Typographies.textMd.withStyles(
              color: AppColors.gray500,
            ),
            contentPadding: AppEdgeInsets.symmetric(
              horizontal: .875.rem,
              vertical: .625.rem,
            ),
            prefixIcon: AppIconButton(
              onPressed: () => {
                // TODO: implement.
              },
              icon: AppIcons.smile,
              color: AppColors.gray500,
              size: 1.25.rem,
            ),
            contentGap: .5.rem,
            suffixIcon: AppRow(
              gap: 1.rem,
              children: [
                AppIconButton(
                  onPressed: () => {
                    // TODO: implement.
                  },
                  icon: AppIcons.attachTilted,
                  color: AppColors.gray500,
                  size: 1.25.rem,
                ),
                AppIconButton(
                  onPressed: () => {
                    // TODO: implement.
                  },
                  icon: AppIcons.microphone,
                  color: AppColors.gray500,
                  size: 1.25.rem,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
