import 'package:flutter/material.dart';

import 'package:edu_track/utils/utils.dart';

import '../paint/paint.dart';
import '../borders/borders.dart';
import '../app_edge_insets_geometry.dart';
import '../../_app_class.dart';

class AppInputDecoration implements AppClass<InputDecoration> {
  final AppEdgeInsetsGeometry? contentPadding;
  final AppTextStyle? counterStyle, errorStyle, helperStyle, hintStyle;
  final AppTextStyle? labelStyle, prefixStyle, suffixStyle;
  final AppInputBorder? border, disabledBorder, enabledBorder, errorBorder;
  final AppInputBorder? focusedBorder, focusedErrorBorder;
  final Widget? counter, error, label, prefix, prefixIcon, suffix, suffixIcon;
  final String? counterText, errorText, helperText, hintText, labelText;
  final String? prefixText, suffixText;
  final int? errorMaxLines, helperMaxLines, hintMaxLines;
  final Color? fillColor, focusColor, hoverColor;
  final bool? filled;
  final Duration? hintFadeDuration;
  final TextDirection? hintTextDirection;

  final bool enabled;

  const AppInputDecoration({
    this.contentPadding,
    this.counterStyle,
    this.errorStyle,
    this.helperStyle,
    this.hintStyle,
    this.labelStyle,
    this.prefixStyle,
    this.suffixStyle,
    this.border,
    this.disabledBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.counter,
    this.counterText,
    this.error,
    this.errorMaxLines,
    this.errorText,
    this.fillColor,
    this.filled,
    this.focusColor,
    this.hoverColor,
    this.helperMaxLines,
    this.helperText,
    this.hintFadeDuration,
    this.hintMaxLines,
    this.hintText,
    this.hintTextDirection,
    this.label,
    this.labelText,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.suffix,
    this.suffixIcon,
    this.suffixText,
    this.enabled = true,
  });

  @override
  InputDecoration compute(BuildContext? context, BoxConstraints? constraints) {
    return InputDecoration(
      contentPadding: contentPadding?.compute(context, constraints),
      counterStyle: counterStyle?.compute(context, constraints),
      errorStyle: errorStyle?.compute(context, constraints),
      helperStyle: helperStyle?.compute(context, constraints),
      hintStyle: hintStyle?.compute(context, constraints),
      labelStyle: labelStyle?.compute(context, constraints),
      prefixStyle: prefixStyle?.compute(context, constraints),
      suffixStyle: suffixStyle?.compute(context, constraints),
      border: border?.compute(context, constraints),
      disabledBorder: disabledBorder?.compute(context, constraints),
      enabledBorder: enabledBorder?.compute(context, constraints),
      errorBorder: errorBorder?.compute(context, constraints),
      focusedBorder: focusedBorder?.compute(context, constraints),
      focusedErrorBorder: focusedErrorBorder?.compute(context, constraints),
      counter: counter,
      counterText: counterText,
      error: error,
      errorMaxLines: errorMaxLines,
      errorText: errorText,
      fillColor: fillColor,
      filled: filled,
      focusColor: focusColor,
      hoverColor: hoverColor,
      helperMaxLines: helperMaxLines,
      helperText: helperText,
      hintFadeDuration: hintFadeDuration,
      hintMaxLines: hintMaxLines,
      hintText: hintText,
      hintTextDirection: hintTextDirection,
      label: label,
      labelText: labelText,
      prefix: prefix,
      prefixIcon: prefixIcon,
      prefixText: prefixText,
      suffix: suffix,
      suffixIcon: suffixIcon,
      suffixText: suffixText,
      enabled: enabled,
    );
  }

  @override
  bool get needsConstraints {
    return [contentPadding].needsConstraints ||
        [
          counterStyle,
          errorStyle,
          helperStyle,
          hintStyle,
          labelStyle,
          prefixStyle,
          suffixStyle,
        ].needsConstraints;
  }

  @override
  bool get needsContext {
    return [contentPadding].needsContext ||
        [
          counterStyle,
          errorStyle,
          helperStyle,
          hintStyle,
          labelStyle,
          prefixStyle,
          suffixStyle,
        ].needsContext;
  }
}
