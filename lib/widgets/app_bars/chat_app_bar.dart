import 'package:edu_track/models/models.dart';
import 'package:edu_track/screens/chats_screen/widgets/profile_image.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

import '../texts/texts.dart';

class MessageChatAppBar extends AppHeaderNav {
  MessageChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHeaderNav(
      leading: AppIconButton(
        onPressed: () => {
          //TODO: implement.
        },
        icon: AppIcons.arrowLeft,
        color: AppColors.gray700,
        size: 1.5.rem,
      ),
      leadingGap: .5.rem,
      title: AppRow(
        gap: .75.rem,
        children: [
          ProfileImage(
            account: Account(
              name: "",
              email: '',
              type: UserType.student,
            ),
          ),
          AppColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextSm.semiBold('Phoenix B.'),
              AppRow(
                mainAxisSize: MainAxisSize.min,
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
                          'LQP',
                          color: AppColors.brand700,
                        ),
                      ],
                    ),
                  ),
                  AppBadge(
                    color: AppColors.pink50,
                    child: TextXs.medium(
                      'Student',
                      color: AppColors.pink700,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      actions: [
        AppIconButton(
          onPressed: () => {
            //TODO: implement.
          },
          icon: AppIcons.phone,
          color: AppColors.gray700,
          size: 1.5.rem,
        ),
        AppIconButton(
          onPressed: () => {
            //TODO: implement.
          },
          icon: AppIcons.moreVertical,
          color: AppColors.gray700,
          size: 1.5.rem,
        ),
      ],
    );
  }
}
