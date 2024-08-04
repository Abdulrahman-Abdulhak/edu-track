import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import '../texts/texts.dart';

class AccountAppBar extends AppHeaderNav {
  final Account account;
  AccountAppBar({super.key, super.actions, required this.account});

  @override
  Widget build(BuildContext context) {
    return AppHeaderNav(
      leading: AccountImage(account: account),
      leadingGap: .75.rem,
      title: AppDefaultTextStyle(
        context: context,
        overflow: TextOverflow.ellipsis,
        child: AppColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSm.semiBold(
              account.name,
              textTransform: TextTransform.capitalize,
              style: const AppTextStyle(color: AppColors.gray900),
            ),
            TextSm(
              account.email,
              color: AppColors.gray600,
              textTransform: TextTransform.lowercase,
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }
}
