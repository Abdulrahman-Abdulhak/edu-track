import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/constants/constants.dart';

import './texts/texts.dart';

class OrganizationBadge extends StatelessWidget {
  final Account account;
  const OrganizationBadge({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return AppBadge(
      iconGap: 0.375.rem,
      color: AppColors.brand50,
      icon: AppIcons.dot,
      iconColor: AppColors.brand500,
      child: TextXs.medium(
        account.name,
        color: AppColors.brand700,
      ),
    );
  }
}
