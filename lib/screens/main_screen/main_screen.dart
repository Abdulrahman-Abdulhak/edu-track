import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/router/router.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.white,
      routes: AppRouter.router.mainTabs,
      appBarBuilder: (context, tabsRouter) {
        if (AppRoutes.isInMessagesPath(tabsRouter.currentPath)) {
          return MessageChatAppBar();
        }

        return MainAppBar(withNotifications: true);
      },
      builder: (context, child) => child,
      bottomNavigationBuilder: (context, tabsRouter) {
        if (AppRoutes.isInMessagesPath(tabsRouter.currentPath)) {
          return const ChatInput();
        }

        return BottomNavBar(tabs: tabsRouter);
      },
    );
  }
}
