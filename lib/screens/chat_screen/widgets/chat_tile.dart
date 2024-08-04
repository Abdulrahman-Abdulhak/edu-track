import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';

import './profile_image.dart';
import '../../../constants/ui/colors.dart';
import '../../../widgets/texts/texts.dart';

class ChatTile extends StatelessWidget {
  final Account account;
  const ChatTile({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      leading: AppSizedBox(
        width: 3.5.rem,
        height: 3.5.rem,
        child: ProfileImage(account: account),
      ),
      title: AppRow(
        gap: .3125.rem,
        children: [
          if (account.type != UserType.organization)
            AppBadge(
              color: AppColors.brand50,
              child: AppRow(
                gap: .375.rem,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppIcon(
                    icon: AppIcons.dot,
                    color: AppColors.brand700,
                  ),
                  TextXs.medium(
                    account.organization!,
                    color: AppColors.brand700,
                  ),
                ],
              ),
            ),
          AppBadge(
            color: AppColors.blue50,
            child: TextXs.medium(
              account.type.name,
              color: AppColors.blue700,
            ),
          ),
        ],
      ),
      subtitle: TextLg.semiBold(account.name),
      trailing: account.messages != null
          ? AppContainer(
              width: 1.25.rem,
              height: 1.25.rem,
              clipBehavior: Clip.antiAlias,
              margin: AppEdgeInsetsDirectional.only(end: 1.rem),
              decoration: const AppBoxDecoration(
                color: AppColors.brand500,
                shape: BoxShape.circle,
              ),
              child: TextXs.medium(
                account.messages!,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
            )
          : null,
    );
  }
}
