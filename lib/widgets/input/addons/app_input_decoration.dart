import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';

import '../../text/text.dart';

class AppInputDecoration {
  final InputBorder? border;
  final AppEdgeInsetsGeometry? contentPadding;
  final Widget? counter;
  final AppTextStyle? counterStyle;
  final String? counterText;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final Widget? error;
  final InputBorder? errorBorder;
  final int? errorMaxLines;
  final AppTextStyle? errorStyle;
  final String? errorText;
  final Color? fillColor;
  final bool? filled;
  final Color? focusColor;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final int? helperMaxLines;
  final AppTextStyle? helperStyle;
  final String? helperText;
  final Duration? hintFadeDuration;
  final int? hintMaxLines;
  final AppTextStyle? hintStyle;
  final String? hintText;
  final TextDirection? hintTextDirection;
  final Widget? label;
  final AppTextStyle? labelStyle;
  final String? labelText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final AppTextStyle? prefixStyle;
  final String? prefixText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final AppTextStyle? suffixStyle;
  final String? suffixText;

  final bool enabled;

  const AppInputDecoration({
    this.border,
    this.contentPadding,
    this.counter,
    this.counterStyle,
    this.counterText,
    this.disabledBorder,
    this.enabledBorder,
    this.error,
    this.errorBorder,
    this.errorMaxLines,
    this.errorStyle,
    this.errorText,
    this.fillColor,
    this.filled,
    this.focusColor,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.helperMaxLines,
    this.helperStyle,
    this.helperText,
    this.hintFadeDuration,
    this.hintMaxLines,
    this.hintStyle,
    this.hintText,
    this.hintTextDirection,
    this.label,
    this.labelStyle,
    this.labelText,
    this.prefix,
    this.prefixIcon,
    this.prefixStyle,
    this.prefixText,
    this.suffix,
    this.suffixIcon,
    this.suffixStyle,
    this.suffixText,
    this.enabled = true,
  });

  InputDecoration compute(BuildContext? context, BoxConstraints? constraints) {
    return InputDecoration(
      border: border,
      contentPadding: contentPadding?.compute(context, constraints),
      counter: counter,
      counterStyle: counterStyle?.compute(context, constraints),
      counterText: counterText,
      disabledBorder: disabledBorder,
      enabledBorder: enabledBorder,
      error: error,
      errorBorder: errorBorder,
      errorMaxLines: errorMaxLines,
      errorStyle: errorStyle?.compute(context, constraints),
      errorText: errorText,
      fillColor: fillColor,
      filled: filled,
      focusColor: focusColor,
      focusedBorder: focusedBorder,
      focusedErrorBorder: focusedErrorBorder,
      helperMaxLines: helperMaxLines,
      helperStyle: helperStyle?.compute(context, constraints),
      helperText: helperText,
      hintFadeDuration: hintFadeDuration,
      hintMaxLines: hintMaxLines,
      hintStyle: hintStyle?.compute(context, constraints),
      hintText: hintText,
      hintTextDirection: hintTextDirection,
      label: label,
      labelStyle: labelStyle?.compute(context, constraints),
      labelText: labelText,
      prefix: prefix,
      prefixIcon: prefixIcon,
      prefixStyle: prefixStyle?.compute(context, constraints),
      prefixText: prefixText,
      suffix: suffix,
      suffixIcon: suffixIcon,
      suffixStyle: suffixStyle?.compute(context, constraints),
      suffixText: suffixText,
      enabled: enabled,
    );
  }

  bool get needsConstraints {
    return contentPadding != null && contentPadding!.needsConstraints ||
        [
          counterStyle,
          errorStyle,
          helperStyle,
          hintStyle,
          labelStyle,
          prefixStyle,
          suffixStyle,
        ].any((style) => style != null && style.needsConstraints);
  }
}
