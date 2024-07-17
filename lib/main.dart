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
      ),
      home: const Initial(widget: Center(child: Text("Testtttttttt"))),
    );
  }
}

// this widgets serves as a first loader to the app
class Initial extends StatelessWidget {
  final Widget widget;
  const Initial({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return widget;
  }
}
