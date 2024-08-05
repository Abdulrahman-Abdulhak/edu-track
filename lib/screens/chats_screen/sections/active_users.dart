import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';

import '../widgets/widgets.dart';

const _activeUsers = [
  Account(
    name: "Olivia Rhye",
    email: "email",
    type: UserType.student,
    organization: "LQP Organization",
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

class ActiveUsers extends StatelessWidget {
  final AppEdgeInsetsGeometry indentation;

  const ActiveUsers({super.key, required this.indentation});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: 1.5.rem,
      children: [
        AppPadding(
          padding: indentation,
          child: TextMd.semiBold('Active Now'),
        ),
        AppSizedBox(
          height: 2.5.rem,
          child: AppListView.separated(
            padding: indentation,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ProfileImage(
              account: _activeUsers[index],
            ),
            itemCount: _activeUsers.length,
            gap: 1.5.rem,
          ),
        ),
      ],
    );
  }
}
