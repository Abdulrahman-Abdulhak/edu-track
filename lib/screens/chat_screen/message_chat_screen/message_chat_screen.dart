import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/providers/providers.dart';

import '../chats_screen/widgets/profile_image.dart';

//TODO: fix later.

@RoutePage()
class MessageChatScreen extends ConsumerWidget {
  final int userId;

  const MessageChatScreen({
    super.key,
    @PathParam('id') required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(UserChatProvider(userId));

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
            ProfileImage(account: user),
            Expanded(
              child: AppColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSm.medium(user.name),
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
                      'Hey Sara, can you please review the latest design when you can?',
                      textWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
