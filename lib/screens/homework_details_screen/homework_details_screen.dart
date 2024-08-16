import 'package:auto_route/auto_route.dart';
import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/app_bars/account_app_bar.dart';
import 'package:flutter/material.dart';

import 'section/sections.dart';

@RoutePage()
class HomeworkDetailsScreen extends StatelessWidget {
  const HomeworkDetailsScreen({super.key});

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
      body: AppSingleChildScrollView(
        child: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: 1.rem, vertical: 2.rem),
          child: AppColumn(
            gap: 1.75.rem,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Task(),
              const SubmissionStatus(),
              const UploadSubmission(),
              const SubmissionComment(),
              GapVertical(size: 2.rem),
              const BottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
