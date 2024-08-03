import 'package:auto_route/auto_route.dart';
import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/screens/chat_screen/chat_tile.dart';
import 'package:edu_track/screens/chat_screen/profile_image.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

@RoutePage()
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: MeassageAppBar(),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(vertical: 1.rem, horizontal: 1.rem),
        child: AppSingleChildScrollView(
          child: AppColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: 1.5.rem,
            children: [
              SearchField(
                onSubmit: (String str) {},
              ),
              TextMd.semiBold('Active Now'),
              ProfileImage(),
              TextMd.semiBold('Recent Message'),
              const ChatTile(),
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
