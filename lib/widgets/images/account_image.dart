import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/constants/constants.dart';

import '../texts/texts.dart';

class AccountImage extends StatelessWidget {
  final UnitSize? width;
  final Account account;

  const AccountImage({
    super.key,
    this.width,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    final widthToUse = width ?? 2.5.rem;

    return AppAvatar(
      color: AppColors.brand50,
      width: widthToUse,
      child: TextMd.regular(
        account.initials,
        textTransform: TextTransform.uppercase,
        style: const AppTextStyle(color: AppColors.brand600),
      ),
    );
  }
}
