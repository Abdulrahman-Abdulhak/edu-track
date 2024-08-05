import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';

import './sections/sections.dart';
import './widgets/widgets.dart';

const _chatUsers = [
  Account(
    name: "Olivia Rhye",
    email: "email",
    type: UserType.student,
    organization: "LQP Organization",
    messages: 2,
  ),
  Account(
    name: "Johnny Johan",
    email: "email",
    type: UserType.student,
    organization: "LQP Organization",
  ),
  Account(
    name: "Olivia Rhye",
    email: "email",
    type: UserType.student,
    organization: "LQP Organization",
  ),
  Account(
    name: "Phoenix B.",
    email: "email",
    type: UserType.teacher,
    organization: "LQP Organization",
  ),
  Account(
    name: "Andi Lane",
    email: "email",
    type: UserType.manager,
    organization: "NOP Organization",
  ),
  Account(
    name: "Natalia Postman",
    email: "email",
    type: UserType.parent,
    organization: "NOP Organization",
  ),
  Account(
    name: "Malia R.",
    email: "email",
    type: UserType.student,
    organization: "NOP Organization",
  ),
];

@RoutePage()
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      ..._chatUsers, // we are using the accounts so we add all of [_chatUsers] items.
    ];

    return AppScaffold(
      appBar: MessageAppBar(),
      body: AppListView.separated(
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
      ),
      //! needs labels
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: AppIcon(icon: AppIcons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: AppIcon(icon: AppIcons.chat),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: AppIcon(icon: AppIcons.calendar),
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: ,
      //     // ),
      //   ],
      // ),
    );
  }
}
