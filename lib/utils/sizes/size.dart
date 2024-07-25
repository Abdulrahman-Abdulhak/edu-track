import 'package:flutter/widgets.dart';

abstract class Size {
  final double value;
  const Size(this.value);

  //* this function is computing the value passed as parameter to original
  //* size unit used in flutter.
  double compute({BuildContext? context, BoxConstraints? constraints});
}
