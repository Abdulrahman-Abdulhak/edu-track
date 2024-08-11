import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart' as models;
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/providers/providers.dart';

class Message extends ConsumerWidget {
  final models.Message msg;

  const Message({super.key, required this.msg});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final sender = msg.sender;

    final isUser = user.id == sender.id;

    Widget result = AppColumn(
      crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        AppRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextSm.medium(
                isUser ? "You" : sender.name,
                color: AppColors.gray700,
              ),
            ),
            TextSm.regular(
              msg.date.toStringSinceNow(context),
              color: AppColors.gray600,
              textTransform: TextTransform.lowercase,
            ),
          ],
        ),
        AppContainer(
          padding: AppEdgeInsets.symmetric(
            vertical: .625.rem,
            horizontal: .875.rem,
          ),
          decoration: AppBoxDecoration(
            color: isUser ? AppColors.brand600 : AppColors.gray100,
            borderRadius: AppBorderRadius.only(
              bottomLeft: AppRadius.circular(.5.rem),
              bottomRight: AppRadius.circular(.5.rem),
              topRight: isUser ? AppRadius.zero : AppRadius.circular(.5.rem),
              topLeft: isUser ? AppRadius.circular(.5.rem) : AppRadius.zero,
            ),
          ),
          child: TextMd.regular(
            msg.text,
            color: isUser ? AppColors.white : AppColors.gray900,
          ),
        ),
      ],
    );

    if (!isUser) {
      result = AppRow(
        gap: .75.rem,
        children: [
          ProfileImage(account: sender),
          Expanded(
            child: result,
          ),
        ],
      );
    }

    return result;
  }
}
