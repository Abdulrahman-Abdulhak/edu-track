import 'package:edu_track/screens/chat_screen/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../constants/ui/colors.dart';
import '../../widgets/texts/texts.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      leading:
          AppSizedBox(width: 3.5.rem, height: 3.5.rem, child: ProfileImage()),
      title: AppRow(
        gap: .38.rem,
        children: [
          AppBadge(
            color: AppColors.brand50,
            child: AppRow(
              gap: .38.rem,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppIcon(
                  icon: AppIcons.dot,
                  color: AppColors.brand700,
                ),
                TextXs.medium(
                  'LQP Organization',
                  color: AppColors.brand700,
                ),
              ],
            ),
          ),
          AppBadge(
            color: AppColors.blue50,
            child: TextXs.medium(
              'Student',
              color: AppColors.blue700,
            ),
          ),
        ],
      ),
      subtitle: TextLg.semiBold('Olivia Rhye'),
      trailing: AppContainer(
        width: 1.25.rem,
        height: 1.25.rem,
        clipBehavior: Clip.antiAlias,
        decoration: const AppBoxDecoration(
          color: AppColors.brand500,
          shape: BoxShape.circle,
        ),
        child: TextXs.medium(
          '2',
          color: AppColors.white,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
