import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/models/models.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import 'package:auto_route/auto_route.dart';

import '../../widgets/texts/texts.dart';
import '../chats_screen/widgets/profile_image.dart';
import '../../widgets/app_bars/app_bars.dart';

@RoutePage()
class MessageChatScreen extends StatelessWidget {
  const MessageChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var massageBoxRadius = AppBorderRadius.only(
      bottomLeft: AppRadius.circular(.5.rem),
      bottomRight: AppRadius.circular(.5.rem),
      topRight: AppRadius.circular(.5.rem),
    );

    return AppScaffold(
      appBar: MessageChatAppBar(),
      body: AppPadding(
        padding: AppEdgeInsets.only(
          top: 1.78.rem,
          right: .44.rem,
          left: .5.rem,
        ),
        child: AppRow(
          gap: .75.rem,
          children: [
            ProfileImage(
              account: Account(
                name: '',
                email: '',
                type: UserType.student,
              ),
            ),
            AppColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppRow(
                  children: [
                    TextSm.medium('Phoenix Baker'),
                    TextSm.regular('Friday 2:20pm'),
                  ],
                ),
                AppContainer(
                  padding: AppEdgeInsets.symmetric(
                    vertical: .62.rem,
                    horizontal: .88.rem,
                  ),
                  decoration: AppBoxDecoration(
                    color: AppColors.gray100,
                    borderRadius: massageBoxRadius,
                  ),
                  child: TextMd.regular(
                      'Hey Sara, can you please review the latest design when you can?'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
