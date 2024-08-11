import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/providers/providers.dart';

import './widgets/widgets.dart';

@RoutePage()
class MessageChatScreen extends ConsumerWidget {
  final int userId;

  const MessageChatScreen({
    super.key,
    @PathParam('id') required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatMessagesProvider(userId));

    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: .5.rem),
      child: AppListView.separated(
        reverse: true,
        gap: 2.rem,
        itemBuilder: (context, index) => Message(msg: messages[index]),
        itemCount: messages.length,
      ),
    );
  }
}
