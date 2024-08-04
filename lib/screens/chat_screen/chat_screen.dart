import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';

import './widgets/widgets.dart';
import './sections/sections.dart';

@RoutePage()
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = AppEdgeInsets.symmetric(vertical: 1.rem, horizontal: 1.rem);

    return AppScaffold(
      appBar: MessageAppBar(),
      body: AppSingleChildScrollView(
        child: AppPadding(
          padding: AppEdgeInsets.symmetric(vertical: padding.vertical / 2),
          child: AppColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: 1.5.rem,
            children: [
              SearchField(
                onSubmit: (String str) {
                  //TODO: implement.
                },
              ),
              ActiveUsers(
                indentation: AppEdgeInsets.symmetric(
                  horizontal: padding.horizontal / 2,
                ),
              ),
              TextMd.semiBold('Recent Message'),
              // const ChatTile(),
            ],
          ),
        ),
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
