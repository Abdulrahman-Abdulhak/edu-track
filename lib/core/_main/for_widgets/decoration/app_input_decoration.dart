import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

import '../box/box.dart';
import '../paint/paint.dart';
import '../borders/borders.dart';
import '../app_edge_insets_geometry.dart';
import '../../_app_class.dart';

class AppInputDecoration implements AppClass<InputDecoration> {
  final AppEdgeInsetsGeometry? contentPadding;
  final List<AppBoxShadow>? shadows;
  final AppTextStyle? counterStyle, errorStyle, floatingLabelStyle, helperStyle;
  final AppTextStyle? hintStyle, labelStyle, prefixStyle, suffixStyle;
  final AppInputBorder? border, disabledBorder, enabledBorder, errorBorder;
  final AppInputBorder? focusedBorder, focusedErrorBorder;
  final AppBoxConstraints? constraints, prefixIconConstraints;
  final AppBoxConstraints? suffixIconConstraints;
  final Widget? counter, error, helper, icon, label, prefix, prefixIcon, suffix;
  final Widget? suffixIcon;
  final String? counterText, errorText, helperText, hintText, labelText;
  final String? prefixText, semanticCounterText, suffixText;
  final int? errorMaxLines, helperMaxLines, hintMaxLines;
  final Color? fillColor, focusColor, hoverColor, iconColor, prefixIconColor;
  final Color? suffixIconColor;
  final bool? alignLabelWithHint, filled, isDense;
  final FloatingLabelAlignment? floatingLabelAlignment;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Duration? hintFadeDuration;
  final TextDirection? hintTextDirection;

  final bool enabled, isCollapsed;

  // not in original InputDecoration
  final UnitSize contentGap, labelGap;

  const AppInputDecoration({
    this.contentPadding,
    this.shadows,
    // text styles
    this.counterStyle,
    this.errorStyle,
    this.floatingLabelStyle,
    this.helperStyle,
    this.hintStyle,
    this.labelStyle,
    this.prefixStyle,
    this.suffixStyle,
    // borders
    this.border,
    this.disabledBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    // input constraints
    this.constraints,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    // widgets
    this.counter,
    this.error,
    this.helper,
    this.icon,
    this.label,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    // strings
    this.counterText,
    this.errorText,
    this.helperText,
    this.hintText,
    this.labelText,
    this.prefixText,
    this.semanticCounterText,
    this.suffixText,
    // integers
    this.errorMaxLines,
    this.helperMaxLines,
    this.hintMaxLines,
    // colors
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.iconColor,
    this.prefixIconColor,
    this.suffixIconColor,
    // booleans
    this.alignLabelWithHint,
    this.filled,
    this.isDense,
    // rest
    this.floatingLabelAlignment,
    this.floatingLabelBehavior,
    this.hintFadeDuration,
    this.hintTextDirection,
    // default valued
    this.enabled = true,
    this.isCollapsed = true,
    this.contentGap = const Rem(.5),
    this.labelGap = const Rem(.375),
  });

  @override
  InputDecoration compute(BuildContext? context, BoxConstraints? constraints) {
    return InputDecoration(
      contentPadding: contentPadding?.compute(context, constraints),
      // text styles
      counterStyle: counterStyle?.compute(context, constraints),
      errorStyle: errorStyle?.compute(context, constraints),
      floatingLabelStyle: floatingLabelStyle?.compute(context, constraints),
      helperStyle: helperStyle?.compute(context, constraints),
      hintStyle: hintStyle?.compute(context, constraints),
      labelStyle: labelStyle?.compute(context, constraints),
      prefixStyle: prefixStyle?.compute(context, constraints),
      suffixStyle: suffixStyle?.compute(context, constraints),
      // borders
      border: border?.compute(context, constraints),
      disabledBorder: disabledBorder?.compute(context, constraints),
      enabledBorder: enabledBorder?.compute(context, constraints),
      errorBorder: errorBorder?.compute(context, constraints),
      focusedBorder: focusedBorder?.compute(context, constraints),
      focusedErrorBorder: focusedErrorBorder?.compute(context, constraints),
      // constraints
      constraints: this.constraints?.compute(context, constraints),
      prefixIconConstraints: prefixIconConstraints?.compute(
        context,
        constraints,
      ),
      suffixIconConstraints: suffixIconConstraints?.compute(
        context,
        constraints,
      ),
      // widgets
      counter: counter,
      error: error,
      helper: helper,
      icon: icon,
      label: label,
      prefix: prefix,
      prefixIcon: prefixIcon,
      suffix: suffix,
      suffixIcon: suffixIcon,
      // strings
      counterText: counterText,
      errorText: errorText,
      helperText: helperText,
      hintText: hintText,
      labelText: labelText,
      prefixText: prefixText,
      semanticCounterText: semanticCounterText,
      suffixText: suffixText,
      // integers
      errorMaxLines: errorMaxLines,
      helperMaxLines: helperMaxLines,
      hintMaxLines: hintMaxLines,
      // colors
      fillColor: fillColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      iconColor: iconColor,
      prefixIconColor: prefixIconColor,
      suffixIconColor: suffixIconColor,
      // booleans
      alignLabelWithHint: alignLabelWithHint,
      filled: filled,
      isDense: isDense,
      // rest
      floatingLabelAlignment: floatingLabelAlignment,
      floatingLabelBehavior: floatingLabelBehavior,
      hintFadeDuration: hintFadeDuration,
      hintTextDirection: hintTextDirection,
      // default valued
      enabled: enabled,
      isCollapsed: isCollapsed,
    );
  }

  @override
  bool get needsConstraints {
    return contentGap.needsConstraints ||
        AppClass.anyNeedsConstraints([
          contentPadding,
          // styles.
          counterStyle,
          errorStyle,
          floatingLabelStyle,
          helperStyle,
          hintStyle,
          labelStyle,
          prefixStyle,
          suffixStyle,
          // borders
          border,
          disabledBorder,
          enabledBorder,
          errorBorder,
          focusedBorder,
          focusedErrorBorder,
          // input constraints
          constraints,
          prefixIconConstraints,
          suffixIconConstraints,
        ]) ||
        shadows != null && shadows!.needsConstraints;
  }

  @override
  bool get needsContext {
    return contentGap.needsContext ||
        AppClass.anyNeedsContext([
              contentPadding,
              // styles.
              counterStyle,
              errorStyle,
              floatingLabelStyle,
              helperStyle,
              hintStyle,
              labelStyle,
              prefixStyle,
              suffixStyle,
              // borders
              border,
              disabledBorder,
              enabledBorder,
              errorBorder,
              focusedBorder,
              focusedErrorBorder,
              // input constraints
              constraints,
              prefixIconConstraints,
              suffixIconConstraints,
            ]) &&
            shadows != null &&
            shadows!.needsContext;
  }
}
