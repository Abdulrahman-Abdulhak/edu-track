//* provides the time units capabilities to create Units directly from the integer number
extension TimeUnits on int {
  //? Time Units
  // it is the value of 1 millisecond {Duration}
  Duration get ms => Duration(milliseconds: this);
  // it is the value of 1 second {Duration}
  Duration get s => Duration(seconds: this);
  // it is the value of 1 minutes {Duration}
  Duration get minute => Duration(minutes: this);
  // it is the value of 1 hour {Duration}
  Duration get h => Duration(hours: this);
  // it is the value of 1 day {Duration}
  Duration get day => Duration(days: this);
}

extension AppInt on int {
  bool devisableBy(int num) => this % num == 0;
}
