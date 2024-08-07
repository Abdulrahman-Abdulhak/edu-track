import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/providers/providers.dart';

import '../widgets/widgets.dart';

class ActiveUsers extends ConsumerWidget {
  final AppEdgeInsetsGeometry indentation;

  const ActiveUsers({super.key, required this.indentation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(chatsProvider);

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
              account: users[index],
            ),
            itemCount: users.length,
            gap: 1.5.rem,
          ),
        ),
      ],
    );
  }
}
