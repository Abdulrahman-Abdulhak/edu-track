import 'package:flutter/widgets.dart';

import 'package:edu_track/utils/utils.dart';

import './app_shadow.dart';
import '../../_app_class.dart';

//* this class is to be used with the AppText widget
class AppTextStyle implements AppClass<TextStyle> {
  final UnitSize? fontSize, wordSpacing, letterSpacing;
  final List<AppShadow>? textShadow;
  final Color? color, decorationColor;
  final double? lineHeight;
  final String? fontFamily;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const AppTextStyle({
    this.fontSize,
    this.wordSpacing,
    this.letterSpacing,
    this.textShadow,
    this.color,
    this.decorationColor,
    this.lineHeight,
    this.decoration,
    this.decorationStyle,
    this.overflow,
    this.fontWeight,
    this.fontFamily,
  });

  AppTextStyle.copy(AppTextStyle? style)
      : fontSize = style?.fontSize,
        wordSpacing = style?.wordSpacing,
        letterSpacing = style?.letterSpacing,
        textShadow = style?.textShadow,
        color = style?.color,
        decoration = style?.decoration,
        decorationStyle = style?.decorationStyle,
        decorationColor = style?.decorationColor,
        overflow = style?.overflow,
        lineHeight = style?.lineHeight,
        fontWeight = style?.fontWeight,
        fontFamily = style?.fontFamily;

  AppTextStyle.fromOrigin(TextStyle style)
      : fontSize = style.fontSize?.px,
        wordSpacing = style.wordSpacing?.px,
        letterSpacing = style.letterSpacing?.px,
        textShadow = AppClass.fromList(style.shadows) as List<AppShadow>?,
        color = style.color,
        decoration = style.decoration,
        decorationStyle = style.decorationStyle,
        decorationColor = style.decorationColor,
        overflow = style.overflow,
        lineHeight = style.height,
        fontWeight = style.fontWeight,
        fontFamily = style.fontFamily;

  //* this function returns a new appTextStyle from the {this} style and
  //* replaces all the null properties with the {style} properties.
  AppTextStyle merge(AppTextStyle? style) {
    return AppTextStyle(
      fontSize: fontSize ?? style?.fontSize,
      wordSpacing: wordSpacing ?? style?.wordSpacing,
      letterSpacing: letterSpacing ?? style?.letterSpacing,
      textShadow: textShadow ?? style?.textShadow,
      color: color ?? style?.color,
      decoration: decoration ?? style?.decoration,
      decorationColor: decorationColor ?? style?.decorationColor,
      decorationStyle: decorationStyle ?? style?.decorationStyle,
      lineHeight: lineHeight ?? style?.lineHeight,
      overflow: overflow ?? style?.overflow,
      fontWeight: fontWeight ?? style?.fontWeight,
      fontFamily: fontFamily ?? style?.fontFamily,
    );
  }

  //* this function creates a new copy of {this} style while using the values
  //* specified in the parameters
  AppTextStyle withStyles({
    UnitSize? fontSize,
    UnitSize? wordSpacing,
    UnitSize? letterSpacing,
    List<AppShadow>? textShadow,
    Color? color,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
    Color? decorationColor,
    TextOverflow? overflow = TextOverflow.clip,
    double? lineHeight,
    FontWeight? fontWeight,
  }) {
    return AppTextStyle(
      fontSize: fontSize,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      textShadow: textShadow,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      lineHeight: lineHeight,
      overflow: overflow,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    ).merge(this);
  }

  //* this function transforms the class into {TextStyle}
  @override
  TextStyle compute(BuildContext? context, BoxConstraints? constraints) {
    //TODO: implement the rest.
    return TextStyle(
      fontSize: fontSize?.compute(context, constraints),
      wordSpacing: wordSpacing?.compute(context, constraints),
      letterSpacing: letterSpacing?.compute(context, constraints),
      shadows: textShadow?.compute(context, constraints),
      color: color,
      decoration: decoration,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
      overflow: overflow,
      height: lineHeight,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  //* this function converts the sizes used in the class to its pixel equivalent
  AppTextStyle toPixelBased([
    BuildContext? context,
    BoxConstraints? constraints,
  ]) {
    return withStyles(
      fontSize: fontSize?.compute(context, constraints).px,
      wordSpacing: wordSpacing?.compute(context, constraints).px,
      letterSpacing: letterSpacing?.compute(context, constraints).px,
    );
  }

  bool isPixelBased() {
    return [fontSize, wordSpacing, letterSpacing].arePixels;
  }

  @override
  bool get needsConstraints =>
      [fontSize, wordSpacing, letterSpacing].needsConstraints ||
      textShadow != null && textShadow!.needsConstraints;

  @override
  bool get needsContext =>
      [fontSize, wordSpacing, letterSpacing].needsContext ||
      textShadow != null && textShadow!.needsContext;
}
