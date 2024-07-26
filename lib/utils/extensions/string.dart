extension AppString on String {
  String capitalize() {
    final words = split(' ');
    var capitalizedString = "";

    for (var word in words) {
      final [firstLetter, rest] = [word.substring(0, 1), word.substring(1)];
      capitalizedString += "${firstLetter.capitalize()}$rest ";
    }

    return capitalizedString.trimLeft();
  }
}
