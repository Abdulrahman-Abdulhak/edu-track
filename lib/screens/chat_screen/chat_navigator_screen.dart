import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

// this widget is purely for navigation purposes only.
@RoutePage()
class ChatNavigatorScreen extends StatelessWidget {
  const ChatNavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
