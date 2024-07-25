import 'package:flutter/widgets.dart';

import 'package:edu_track/utils/extensions/num.dart';
import 'package:edu_track/utils/sizes/sizes.dart';

//* this class is to be used with the AppText widget
class AppTextStyle {
  final UnitSize? fontSize;
  final Color? color, decorationColor;
  final double? wordSpacing, letterSpacing, lineHeight;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final List<Shadow>? textShadow;

  const AppTextStyle({
    this.fontSize,
    this.color,
    this.decorationColor,
    this.wordSpacing,
    this.letterSpacing,
    this.lineHeight,
    this.decoration,
    this.decorationStyle,
    this.overflow,
    this.fontWeight,
    this.textShadow,
  });

  AppTextStyle.style(AppTextStyle? style)
      : fontSize = style?.fontSize,
        color = style?.color,
        wordSpacing = style?.wordSpacing,
        letterSpacing = style?.letterSpacing,
        decoration = style?.decoration,
        decorationStyle = style?.decorationStyle,
        decorationColor = style?.decorationColor,
        overflow = style?.overflow,
        lineHeight = style?.lineHeight,
        fontWeight = style?.fontWeight,
        textShadow = style?.textShadow;

  AppTextStyle.textStyle(TextStyle style)
      : fontSize = style.fontSize?.px,
        color = style.color,
        wordSpacing = style.wordSpacing,
        letterSpacing = style.letterSpacing,
        decoration = style.decoration,
        decorationStyle = style.decorationStyle,
        decorationColor = style.decorationColor,
        overflow = style.overflow,
        lineHeight = style.height,
        fontWeight = style.fontWeight,
        textShadow = style.shadows;

  //* this function returns a new appTextStyle from the {this} style and
  //* replaces all the null properties with the {style} properties.
  AppTextStyle merge(AppTextStyle? style) {
    return AppTextStyle(
      color: color ?? style?.color,
      decoration: decoration ?? style?.decoration,
      decorationColor: decorationColor ?? style?.decorationColor,
      decorationStyle: decorationStyle ?? style?.decorationStyle,
      fontSize: fontSize ?? style?.fontSize,
      letterSpacing: letterSpacing ?? style?.letterSpacing,
      lineHeight: lineHeight ?? style?.lineHeight,
      overflow: overflow ?? style?.overflow,
      textShadow: textShadow ?? style?.textShadow,
      wordSpacing: wordSpacing ?? style?.wordSpacing,
      fontWeight: fontWeight ?? style?.fontWeight,
    );
  }

  //* this function creates a new copy of {this} style while using the values
  //* specified in the parameters
  AppTextStyle withStyles({
    Color? color,
    UnitSize? fontSize,
    double? wordSpacing,
    double? letterSpacing,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
    Color? decorationColor,
    TextOverflow? overflow = TextOverflow.clip,
    double? lineHeight,
    FontWeight? fontWeight,
    List<Shadow>? textShadow,
  }) {
    return AppTextStyle(
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      lineHeight: lineHeight,
      overflow: overflow,
      textShadow: textShadow,
      fontWeight: fontWeight,
      wordSpacing: wordSpacing,
    ).merge(this);
  }

  //* this function transforms the class into {TextStyle}
  TextStyle toTextStyle(BuildContext? context, BoxConstraints? constraints) {
    return TextStyle(
      color: color,
      fontSize: fontSize?.compute(context, constraints),
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      decoration: decoration,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
      overflow: overflow,
      height: lineHeight,
      fontWeight: fontWeight,
      shadows: textShadow,
    );
  }

  //* this function converts from {TextStyle} into {AppTextStyle}
  TextStyle fromTextStyle(BuildContext? context, BoxConstraints? constraints) {
    return TextStyle(
      color: color,
      fontSize: fontSize?.compute(context, constraints),
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      decoration: decoration,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
      overflow: overflow,
      height: lineHeight,
      fontWeight: fontWeight,
      shadows: textShadow,
    );
  }

  //* this function converts the sizes used in the class to its pixel equivalent
  AppTextStyle toPixelBased([
    BuildContext? context,
    BoxConstraints? constraints,
  ]) {
    return withStyles(
      fontSize: fontSize?.compute(context, constraints).px,
    );
  }

  bool isPixelBased() {
    return fontSize == null || fontSize is Pixel;
  }
}
