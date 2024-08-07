import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/providers/providers.dart';

import 'sections/sections.dart';
import 'widgets/widgets.dart';

@RoutePage()
class ChatsScreen extends ConsumerWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(chatsProvider);

    final padding = AppEdgeInsets.symmetric(vertical: 1.rem, horizontal: 1.rem);
    final inlinePadding = AppEdgeInsets.symmetric(
      horizontal: padding.horizontal / 2,
    );

    // list of all items used to display on the scroller.
    final itemsOfScroller = [
      AppPadding(
        padding: inlinePadding,
        child: SearchField(
          filterAction: () {
            //TODO: implement.
          },
          onSubmit: (String str) {
            //TODO: implement.
          },
        ),
      ),
      ActiveUsers(
        indentation: AppEdgeInsets.symmetric(
          horizontal: padding.horizontal / 2,
        ),
      ),
      AppPadding(
        padding: inlinePadding,
        child: TextMd.semiBold('Recent Message'),
      ),
      ...users, // we are using the accounts so we add all of [_chatUsers] items.
    ];

    return AppListView.separated(
      padding: AppEdgeInsets.symmetric(vertical: padding.vertical / 2),
      gap: 1.5.rem,
      itemCount: itemsOfScroller.length,
      itemBuilder: (context, index) {
        final item = itemsOfScroller[index];

        if (item is Widget) return item;
        return AppPadding(
          padding: inlinePadding,
          child: ChatTile(account: item as Account),
        );
      },
    );
  }
}
