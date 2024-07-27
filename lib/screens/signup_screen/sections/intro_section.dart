import 'package:flutter/material.dart';

import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import '../logo.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: [
        Logo(size: 2.25.em),
        TextDisplayXs.semiBold(
          translation(context).joinOurCommunity,
          textTransform: TextTransform.capitalize,
          style: const AppTextStyle(color: AppColors.gray900),
        ),
      ],
    );
  }
}
