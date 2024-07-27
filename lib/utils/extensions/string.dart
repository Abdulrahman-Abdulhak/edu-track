import 'package:flutter/material.dart';

extension AppString on String {
  static const sentencesSeparators = ['.', ',', '\n', '\t', '\r'];
  static const wordsSeparators = [' ', '\n', '\t', '\r'];

  List<String> get sentences {
    final List<String> sentences = [];

    var currentSentence = "";
    for (var char in characters) {
      currentSentence += char;

      if (sentencesSeparators.contains(char)) {
        sentences.add(currentSentence);
        currentSentence = "";
      }
    }
    sentences.add(currentSentence);

    return sentences;
  }

  String capitalizeSentence() {
    var result = "";
    for (var sentence in sentences) {
      result += sentence.capitalize();
    }

    return result;
  }

  List<String> get words {
    final List<String> words = [];

    var currentWord = "";
    for (var char in characters) {
      currentWord += char;

      if (wordsSeparators.contains(char)) {
        words.add(currentWord);
        currentWord = "";
      }
    }
    words.add(currentWord);

    return words;
  }

  String capitalizeWord() {
    var result = "";

    for (var word in words) {
      result += word.capitalize();
    }

    return result;
  }

  String capitalize() {
    return "${substring(0, 1).toUpperCase()}${substring(1)}";
  }
}
