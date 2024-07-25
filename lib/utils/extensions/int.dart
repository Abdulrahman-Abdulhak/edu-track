//* provides the time units capabilities to create Units directly from the integer number
extension TimeUnits on int {
  //? Time Units
  // it is the value of 1 millisecond {Duration}
  get ms => Duration(milliseconds: this);
  // it is the value of 1 second {Duration}
  get s => Duration(seconds: this);
}
