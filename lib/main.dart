import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import 'package:edu_track/screens/sibebar_navigation_screen/sidebar_navigation.dart';
// import 'package:edu_track/screens/signup_screen/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Inter",
      ),
      locale: L10n.defaultLocal,
      supportedLocales: L10n.all,
      localizationsDelegates: L10n.delegates,
      home: const WidgetLoader(
        // insert the main widget here.
        main: SidebarNavigationScreen(),
      ),
    );
  }
}

// this widgets serves as a first loader to the app
class WidgetLoader extends StatelessWidget {
  final Widget main;
  const WidgetLoader({super.key, required this.main});

  @override
  Widget build(BuildContext context) {
    return main;
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDefaultTextStyle(
        style: const AppTextStyle(),
        context: context,
        child: Center(
          child: AppText(
            5.cqw + 1,
            style: AppTextStyle(fontSize: 5.cqw + 1.rem),
          ),
        ),
      ),
    );
  }
}
