import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edu_track/router/router.dart';
import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/providers/providers.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
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
      routerConfig: AppRouter.router.config(),
      builder: (context, child) {
        return WidgetLoader(
          main: child ?? const Center(child: Text("No child provided")),
        );
      },
    );
  }
}

// this widgets serves as a first loader to the app
class WidgetLoader extends ConsumerWidget {
  final Widget main;
  const WidgetLoader({super.key, required this.main});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadedResult = ref.watch(loadedProvider);

    final loaded = switch (loadedResult) {
      AsyncData(:final value) => value,
      _ => false,
    };

    return loaded
        ? main
        : const Center(
            child:
                CircularProgressIndicator(), //TODO: replace with splash screen.
          );
  }
}
