import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/router/router.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class ChatTile extends StatelessWidget {
  final Account account;
  const ChatTile({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(MessageChatRoute(userId: account.id)),
      child: AppListTile(
        leading: AppSizedBox(
          width: 3.5.rem,
          height: 3.5.rem,
          child: ProfileImage(account: account),
        ),
        title: AppRow(
          gap: .3125.rem,
          children: [
            // There is non need for the organization tag if the chat is with the organization it self.
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
                // According to the design the messages counter should appear
                // a bit to the left of the end of the tile
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
      ),
    );
  }
}
