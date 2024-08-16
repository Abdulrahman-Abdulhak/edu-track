import 'package:auto_route/auto_route.dart';
import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/screens/homework_screen/sections/sections.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

@RoutePage()
class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AccountAppBar(
        account: const Account(
          id: 4793025,
          name: "Elite Scholars Academy",
          email: "esa@test.com",
          type: UserType.organization,
        ),
        actions: [
          AppIcon(
            icon: AppIcons.notification,
            color: AppColors.gray700,
            size: 1.5.rem,
          ),
        ],
      ),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: 1.rem, vertical: 2.rem),
        child: AppColumn(
          gap: 1.5.rem,
          children: const [
            Search(),
            TaskSection(),
          ],
        ),
      ),
    );
  }
}
