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

    return AppScaffold(
      appBar: MessageAppBar(),
      body: AppListView.separated(
        padding: AppEdgeInsets.symmetric(vertical: padding.vertical / 2),
        gap: 1.5.rem,
        itemCount: _chatUsers.length + 3, // add the 3 normal widgets.
        itemBuilder: (context, index) {
          if (index == 0) {
            return AppPadding(
              padding: inlinePadding,
              child: SearchField(
                onSubmit: (String str) {
                  //TODO: implement.5
                },
              ),
            );
          }
          if (index == 1) {
            return ActiveUsers(
              indentation: AppEdgeInsets.symmetric(
                horizontal: padding.horizontal / 2,
              ),
            );
          }
          if (index == 2) {
            return AppPadding(
              padding: inlinePadding,
              child: TextMd.semiBold('Recent Message'),
            );
          }
          return AppPadding(
            padding: inlinePadding,
            child: ChatTile(account: _chatUsers[index - 3]),
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
