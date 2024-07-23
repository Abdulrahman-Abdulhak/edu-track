import 'package:edu_track/screens/signup_screen/signup.dart';
import 'package:flutter/material.dart';

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
      home: SignupScreen(),
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
