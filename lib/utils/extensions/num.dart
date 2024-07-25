import '../sizes/sizes.dart';

extension Units on num {
  //? Size Units
  get px => Pixel(toDouble());
  get rem => Rem(toDouble());
  get em => Em(toDouble());

  get vh => ViewHeight(toDouble());
  get vw => ViewWidth(toDouble());
  get vmin => ViewMin(toDouble());
  get vmax => ViewMax(toDouble());
  get cqh => ContainerHeight(toDouble());
  get cqw => ContainerWidth(toDouble());
  get cqmin => ContainerMin(toDouble());
  get cqmax => ContainerMax(toDouble());
}
