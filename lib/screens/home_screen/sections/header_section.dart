import 'package:edu_track/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class HeaderSection extends ConsumerWidget {
  final UnitSize inlinePadding;
  final Account user;

  const HeaderSection({
    super.key,
    required this.inlinePadding,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesProvider);
    final isNewUser = MainPreferences.getUserFirstTime(preferences);

    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: inlinePadding),
      child: AppColumn(
        gap: 1.5.rem,
        children: [
          SearchField(
            onSubmit: (str) {
              //TODO: implement.
            },
          ),
          AppColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: .25.rem,
            children: [
              TextDisplayXs.semiBold(
                "Welcome ${isNewUser ? "" : "back, "}${user.name}",
                color: AppColors.gray900,
              ),
              TextMd(
                "Organize, monitor, and stay on top of your study progress and exam results.",
                color: AppColors.gray600,
              )
            ],
          ),
        ],
      ),
    );
  }
}
