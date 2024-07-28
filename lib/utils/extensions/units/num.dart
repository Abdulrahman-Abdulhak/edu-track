import '../../sizes/sizes.dart';

//* provides the size capabilities to create Units directly from any number
extension SizeUnits on num {
  // it is the value of 1 logical screen pixel.
  Pixel get px => Pixel(toDouble());
  // it is the value of the app's initial fontSize (Root Em).
  Rem get rem => Rem(toDouble());
  // it is the value of the current fontSize specified at the last {AppDefaultTextStyle}.
  Em get em => Em(toDouble());

  // it is 1% of the screen's height (View Height).
  ViewHeight get vh => ViewHeight(toDouble());
  // it is 1% of the screen's width (View Width).
  ViewWidth get vw => ViewWidth(toDouble());
  // it is 1% of the screen's smallest dimension (View Min).
  ViewMin get vmin => ViewMin(toDouble());
  // it is 1% of the screen's biggest dimension (View Max).
  ViewMax get vmax => ViewMax(toDouble());

  // it is 1% of parent widget's height (Container Query Height).
  ContainerHeight get cqh => ContainerHeight(toDouble());
  // it is 1% of parent widget's width (Container Query Width).
  ContainerWidth get cqw => ContainerWidth(toDouble());
  // it is 1% of parent widget's smallest dimension (Container Query Min).
  ContainerMin get cqmin => ContainerMin(toDouble());
  // it is 1% of parent widget's biggest dimension (Container Query Max).
  ContainerMax get cqmax => ContainerMax(toDouble());
}
