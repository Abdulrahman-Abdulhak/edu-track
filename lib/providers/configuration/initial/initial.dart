import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data.dart';

part 'initial.g.dart';

@Riverpod(dependencies: [Preferences])
Future<bool> loaded(LoadedRef ref) async {
  final preferences = ref.watch(preferencesProvider);

  final loadingList = [preferences != null];

  return loadingList.every((test) => test);
}
