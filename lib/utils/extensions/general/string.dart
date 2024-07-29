import 'package:flutter/material.dart';

import './object.dart';

extension AppString on String {
  static const sentencesSeparators = ['.', ',', '\n', '\t', '\r'];
  static const wordsSeparators = [' ', '\n', '\t', '\r'];

  List<String> sentences([bool keepSeparators = false]) {
    final List<String> sentences = [];

    var currentSentence = "";
    for (var char in characters) {
      if (wordsSeparators.contains(char)) {
        if (keepSeparators) currentSentence += char;
        sentences.add(currentSentence);
        currentSentence = "";
      } else {
        currentSentence += char;
      }
    }
    sentences.add(currentSentence);

    return sentences;
  }

  String get firstChar => isEmpty ? '' : substring(0, 1);

  String capitalizeSentence() {
    var result = "";
    for (var sentence in sentences(true)) {
      result += sentence.capitalize();
    }

    return result;
  }

  List<String> words([bool keepSeparators = false]) {
    final List<String> words = [];

    var currentWord = "";
    for (var char in characters) {
      if (wordsSeparators.contains(char)) {
        if (keepSeparators) currentWord += char;
        words.add(currentWord);
        currentWord = "";
      } else {
        currentWord += char;
      }
    }
    words.add(currentWord);

    words.removeWhere((word) => !word.logical);

    return words;
  }

  String capitalizeWord() {
    var result = "";

    for (var word in words(true)) {
      result += word.capitalize();
    }

    return result;
  }

  String capitalize() {
    return "${firstChar.toUpperCase()}${substring(1)}";
  }
}
