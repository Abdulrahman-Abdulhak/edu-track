import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';

import './nav_item.dart';

class NavItems extends StatelessWidget {
  final List<NavItem> items;
  const NavItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: .25.rem,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }
}
