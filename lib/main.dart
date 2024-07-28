import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import 'package:edu_track/screens/signup_screen/sign_up.dart';

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
      home: const SignUpScreen(),
    );
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
            "Testing Me",
            style: AppTextStyle(fontSize: 5.cqw),
          ),
        ),
      ),
    );
  }
}

// this widgets serves as a first loader to the app
// class Initial extends StatelessWidget {
//   final Widget widget;
//   const Initial({super.key, required this.widget});
//
//   @override
//   Widget build(BuildContext context) {
//     return widget;
//   }
// }
