//* provides the capabilities to create Units directly from the integer number
extension Units on int {
  //? Time Units
  // it is the value of 1 millisecond {Duration}
  get ms => Duration(milliseconds: this);
  // it is the value of 1 second {Duration}
  get s => Duration(seconds: this);
}
