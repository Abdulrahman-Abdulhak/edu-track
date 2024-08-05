import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/router/router.dart';
import 'package:edu_track/widgets/widgets.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      routes: AppRouter.router.mainTabs,
      appBar: MainAppBar(withNotifications: true),
      builder: (context, child) => child,
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavBar(tabs: tabsRouter);
      },
    );
  }
}
