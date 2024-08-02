import 'package:edu_track/screens/payment_screen/payment_screen.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/router/router.dart';
import 'package:edu_track/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final _router = AppRouter();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EduTrack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Inter",
      ),
      locale: L10n.defaultLocal,
      supportedLocales: L10n.all,
      localizationsDelegates: L10n.delegates,
      routerConfig: _router.config(),
      builder: (context, child) {
        return WidgetLoader(
          main: child ?? const Center(child: Text("No child provided")),
        );
      },
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
