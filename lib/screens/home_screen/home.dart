import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';

import 'package:edu_track/core/core.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Got Here"),
      ),
    );
  }
}
