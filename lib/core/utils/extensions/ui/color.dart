import 'dart:math';

import 'package:flutter/widgets.dart';

extension AppColor on Color {
  static double computeContrastRatio(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();

    final brightest = max(luminance1, luminance2);
    final darkest = min(luminance1, luminance2);

    return (brightest + 0.05) / (darkest + 0.05);
  }

  // Color setContrastTo(Color color, [double contrast = 4.5]) {
  //   var color1 = this;
  //   var color2 = color;
  //   var currentContrast = color1.inContrastTo(color2);

  //   if (currentContrast == contrast) {
  //     return this;
  //   }

  //   var isDarker = color1.isDarker(color2);
  //   while (currentContrast < contrast) {
  //     color1 = isDarker ? color1.lighten() : color1.darken();
  //     currentContrast = color1.inContrastTo(color2);
  //   }

  //   return color1;
  // }

  Color withLuminance(double luminance) {
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness(luminance.clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Color darken([double percent = .1]) {
    assert(percent >= 0 && percent <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness(
      (hsl.lightness - percent).clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  Color lighten([double percent = .1]) {
    assert(percent >= 0 && percent <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness(
      (hsl.lightness * percent).clamp(0.0, 1.0),
    );

    return hslLight.toColor();
  }

  double inContrastTo(Color color) {
    return computeContrastRatio(this, color);
  }

  bool isDarker(Color color) {
    if (value == color.value) {
      return computeLuminance() < 0.5;
    }
    return computeLuminance() < color.computeLuminance();
  }

  bool isLighter(Color color) {
    return computeLuminance() > color.computeLuminance();
  }
}
