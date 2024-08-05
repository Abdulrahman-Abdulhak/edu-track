import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../text/text.dart';
import '../layout/layout.dart';
import '../../_main/main.dart';
import '../../utils/utils.dart';
import '../../types/types.dart' as types;

enum InputValidatorTiming {
  valueChange,
  focusOut,
}

class AppTextField extends StatefulWidget {
  final UnitSize? caretHeight;
  final AppInputDecoration? decoration;
  final AppTextStyle? style;
  final List<String>? autofillHints;
  final types.InputCounterWidgetBuilder? buildCounter;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final types.EditableTextContextMenuBuilder? contextMenuBuilder;
  final TextEditingController? controller;
  final Color? caretColor, caretErrorColor;
  final bool? caretOpacityAnimates, enableInteractiveSelection, enabled;
  final bool? showCaret;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final int? maxLength, maxLines, minLines;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final MouseCursor? mouseCursor;
  final types.AppPrivateCommandCallback? onAppPrivateCommand;
  final types.VoidFunctionString? onChange, onSubmit;
  final types.VoidFunction? onEditingComplete, onTap;
  final types.PointerDownEventCallBack? onTapOutside;
  final types.TextErrorCheckCallBack? validator;
  final String? restorationId;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final TextSelectionControls? selectionControls;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final WidgetStatesController? statesController;
  final StrutStyle? strutStyle;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final UndoHistoryController? undoController;

  final UnitSize caretWidth;
  final AppEdgeInsets scrollPadding;
  final bool autoCorrect, autoFocus, canRequestFocus;
  final bool enableIMEPersonalizedLearning, enableSuggestions, expands;
  final bool obscureText, onTapAlwaysCalled, readOnly, scribbleEnabled;
  final Clip clipBehavior;
  final DragStartBehavior dragStartBehavior;
  final String obscuringCharacter;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final InputValidatorTiming validatorTiming;

  const AppTextField(
      {super.key,
      this.caretHeight,
      this.decoration,
      this.style,
      this.autofillHints,
      this.buildCounter,
      this.contentInsertionConfiguration,
      this.contextMenuBuilder,
      this.controller,
      this.caretColor,
      this.caretErrorColor,
      this.caretOpacityAnimates,
      this.enableInteractiveSelection,
      this.enabled,
      this.showCaret,
      this.focusNode,
      this.inputFormatters,
      this.keyboardAppearance,
      this.keyboardType,
      this.magnifierConfiguration,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.maxLengthEnforcement,
      this.mouseCursor,
      this.onAppPrivateCommand,
      this.onChange,
      this.onSubmit,
      this.onEditingComplete,
      this.onTap,
      this.onTapOutside,
      this.validator,
      this.restorationId,
      this.scrollController,
      this.scrollPhysics,
      this.selectionControls,
      this.smartDashesType,
      this.smartQuotesType,
      this.spellCheckConfiguration,
      this.statesController,
      this.strutStyle,
      this.textAlignVertical,
      this.textDirection,
      this.textInputAction,
      this.undoController,
      this.caretWidth = const Pixel(2),
      this.scrollPadding = const AppEdgeInsets.all(Pixel(20)),
      this.autoCorrect = false,
      this.enableIMEPersonalizedLearning = true,
      this.enableSuggestions = true,
      this.expands = false,
      this.autoFocus = false,
      this.canRequestFocus = true,
      this.obscureText = false,
      this.onTapAlwaysCalled = false,
      this.readOnly = false,
      this.scribbleEnabled = true,
      this.clipBehavior = Clip.hardEdge,
      this.dragStartBehavior = DragStartBehavior.start,
      this.obscuringCharacter = '*',
      this.selectionHeightStyle = BoxHeightStyle.tight,
      this.selectionWidthStyle = BoxWidthStyle.tight,
      this.textAlign = TextAlign.start,
      this.textCapitalization = TextCapitalization.none,
      this.validatorTiming = InputValidatorTiming.focusOut});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends AppState<AppTextField> {
  FocusNode? _focusNode, _usedFocusNode;
  TextEditingController? _controller, _usedController;

  bool _isEmpty = true, _isFocused = false, _isHovered = false;
  bool _isError = false;

  void errorCheck(TextEditingController controller) {
    if (widget.validator == null) return;

    final isError = widget.validator!(controller.text);
    if (isError != _isError) {
      setState(() => _isError = isError);
    }
  }

  void onFocusChanged(TextEditingController controller, FocusNode focusNode) {
    focusNode.addListener(() {
      final focus = focusNode.hasFocus;
      if (focus == _isFocused) return; // nothing changed.

      if (widget.validatorTiming == InputValidatorTiming.focusOut) {
        if (_isFocused && !focus) errorCheck(controller);
      }

      setState(() {
        _isFocused = focus;
      });
    });
  }

  void focusEvents() {
    final focusNode = _usedFocusNode!;
    final controller = _usedController!;

    onFocusChanged(controller, focusNode);
  }

  void onChanged(TextEditingController controller) {
    controller.addListener(() {
      final text = controller.text;

      if (widget.validatorTiming == InputValidatorTiming.valueChange) {
        errorCheck(controller);
      }

      if (text.isEmpty) setState(() => _isEmpty = true);
      widget.onChange?.call(text);
    });
  }

  void textEvents() {
    final controller = _usedController!;
    onChanged(controller);
  }

  void watchEvents() {
    focusEvents();
    textEvents();
  }

  @override
  void initState() {
    if (widget.focusNode == null) _focusNode = FocusNode();
    _usedFocusNode = widget.focusNode ?? _focusNode;

    if (widget.focusNode == null) _controller = TextEditingController();
    _usedController = widget.controller ?? _controller;

    watchEvents();
    super.initState();
  }

  void onTap() {
    final focusNode = _usedFocusNode!;
    final onTapAlwaysCalled = widget.onTapAlwaysCalled;
    final onTap = widget.onTap;

    if (widget.canRequestFocus && !_isFocused) {
      focusNode.requestFocus();
    }

    if (!_isFocused || onTapAlwaysCalled) {
      onTap?.call();
    }
  }

  void onSubmitted(String text) {
    widget.onSubmit?.call(text);
  }

  void onEditingComplete() {
    widget.onEditingComplete?.call();
  }

  void onMouseEnter(PointerEnterEvent _) {
    setState(() => _isHovered = true);
  }

  void onMouseExit(PointerExitEvent _) {
    setState(() => _isHovered = false);
  }

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? widgetConstraints) {
    //TODO: make use of all unused variables declared here.
    final isEmpty = _isEmpty;
    final isFocused = _isFocused;
    final isHovered = _isHovered;
    final isError = _isError;

    final focusNode = _usedFocusNode!;
    final controller = _usedController!;

    final decoration = widget.decoration;

    final alignLabelWithHint = decoration?.alignLabelWithHint;
    final contentPadding = decoration?.contentPadding;
    final shadows = decoration?.shadows;
    final constraints = decoration?.constraints;
    final contentGap = decoration?.contentGap;

    final prefix = decoration?.prefix;
    final prefixIcon = decoration?.prefixIcon;
    final errorPrefixIcon = decoration?.errorPrefixIcon;
    final prefixIconColor = decoration?.prefixIconColor;
    final prefixIconConstraints = decoration?.prefixIconConstraints;
    final prefixStyle = decoration?.prefixStyle;
    final prefixText = decoration?.prefixText;

    final prefixIconToUse = isError ? errorPrefixIcon : prefixIcon;

    final suffix = decoration?.suffix;
    final suffixIcon = decoration?.suffixIcon;
    final errorSuffixIcon = decoration?.errorSuffixIcon;
    final suffixIconColor = decoration?.suffixIconColor;
    final suffixIconConstraints = decoration?.suffixIconConstraints;
    final suffixStyle = decoration?.suffixStyle;
    final suffixText = decoration?.suffixText;

    final suffixIconToUse = isError ? errorSuffixIcon : suffixIcon;

    final counter = decoration?.counter;
    final counterStyle = decoration?.counterStyle;
    final counterText = decoration?.counterText;
    final semanticCounterText = decoration?.semanticCounterText;

    final filled = decoration?.filled ?? true;
    final fillColor = decoration?.fillColor;
    final border = decoration?.border;

    final enabled = widget.enabled ?? decoration?.enabled;
    final enabledBorder = decoration?.enabledBorder;
    final disabledBorder = decoration?.disabledBorder;

    final error = decoration?.error;
    final errorBorder = decoration?.errorBorder;
    final errorMaxLines = decoration?.errorMaxLines;
    final errorStyle = decoration?.errorStyle;
    final errorText = decoration?.errorText;

    final errorToUse = error ??
        (errorText != null
            ? AppText(
                errorText,
                maxLineCount: errorMaxLines,
                style: errorStyle,
              )
            : null);

    final focusColor = decoration?.focusColor;
    final focusedBorder = decoration?.focusedBorder;
    final focusedErrorBorder = decoration?.focusedErrorBorder;

    final floatingLabelAlignment = decoration?.floatingLabelAlignment;
    final floatingLabelBehavior = decoration?.floatingLabelBehavior;
    final floatingLabelStyle = decoration?.floatingLabelStyle;

    final helper = decoration?.helper;
    final helperMaxLines = decoration?.helperMaxLines;
    final helperStyle = decoration?.helperStyle;
    final helperText = decoration?.helperText;

    final helperToUse = helper ??
        (helperText != null
            ? AppText(
                helperText,
                maxLineCount: helperMaxLines,
                style: helperStyle,
              )
            : null);

    final hintFadeDuration = decoration?.hintFadeDuration;
    final hintMaxLines = decoration?.hintMaxLines;
    final hintStyle = decoration?.hintStyle;
    final hintText = decoration?.hintText;
    final hintTextDirection = decoration?.hintTextDirection;

    final hoverColor = decoration?.hoverColor;

    final icon = decoration?.icon;
    final iconColor = decoration?.iconColor;

    final isCollapsed = decoration?.isCollapsed;
    final isDense = decoration?.isDense;

    final label = decoration?.label;
    final labelStyle = decoration?.labelStyle;
    final labelText = decoration?.labelText;
    final labelGap = decoration?.labelGap;

    // TextField specific params.
    final autoCorrect = widget.autoCorrect;
    final autoFocus = widget.autoFocus;
    final canRequestFocus = widget.canRequestFocus;
    final enableIMEPersonalizedLearning = widget.enableIMEPersonalizedLearning;
    final enableInteractiveSelection = widget.enableInteractiveSelection;
    final enableSuggestions = widget.enableSuggestions;
    final scribbleEnabled = widget.scribbleEnabled;
    final expands = widget.expands;

    final autofillHints = widget.autofillHints;

    final buildCounter = widget.buildCounter;
    final contextMenuBuilder = widget.contextMenuBuilder;

    final showCaret = widget.showCaret;
    final caretColor = widget.caretColor;
    final caretErrorColor = widget.caretErrorColor;
    final caretHeight = widget.caretHeight;
    final caretWidth = widget.caretWidth;
    final caretOpacityAnimates = widget.caretOpacityAnimates;

    final clipBehavior = widget.clipBehavior;

    final contentInsertionConfiguration = widget.contentInsertionConfiguration;
    final dragStartBehavior = widget.dragStartBehavior;
    final magnifierConfiguration = widget.magnifierConfiguration;
    final spellCheckConfiguration = widget.spellCheckConfiguration;

    final inputFormatters = widget.inputFormatters;

    final keyboardAppearance = widget.keyboardAppearance;
    final keyboardType = widget.keyboardType;

    final maxLines = widget.maxLines;
    final minLines = widget.minLines;
    final maxLength = widget.maxLength;
    final maxLengthEnforcement = widget.maxLengthEnforcement;

    final mouseCursor = widget.mouseCursor;

    final obscureText = widget.obscureText;
    final obscuringCharacter = widget.obscuringCharacter;

    final onAppPrivateCommand = widget.onAppPrivateCommand;
    final onTapOutside = widget.onTapOutside;

    final readOnly = widget.readOnly;

    final restorationId = widget.restorationId;

    final scrollController = widget.scrollController;
    final scrollPadding = widget.scrollPadding;
    final scrollPhysics = widget.scrollPhysics;

    final selectionControls = widget.selectionControls;
    final selectionHeightStyle = widget.selectionHeightStyle;
    final selectionWidthStyle = widget.selectionWidthStyle;

    final smartDashesType = widget.smartDashesType;
    final smartQuotesType = widget.smartQuotesType;

    final statesController = widget.statesController;
    final undoController = widget.undoController;

    final strutStyle = widget.strutStyle;

    final style = widget.style;
    final textAlign = widget.textAlign;
    final textAlignVertical = widget.textAlignVertical;
    final textCapitalization = widget.textCapitalization;
    final textDirection = widget.textDirection;

    final textInputAction = widget.textInputAction;

    AppTextStyle? styleUsed;
    AppInputBorder? borderUsed;
    Color? backgroundColorUsed;

    if (isFocused) {
      backgroundColorUsed ??= focusColor;
    }
    if (isHovered) {
      backgroundColorUsed ??= hoverColor;
    }

    if (enabled != null && !enabled) {
      borderUsed ??= disabledBorder;
    }
    if (isFocused && isError) {
      borderUsed ??= focusedErrorBorder ?? errorBorder;
    } else if (isError) {
      borderUsed = errorBorder;
    } else if (isFocused) {
      borderUsed = focusedBorder;
    }
    if (enabled != null && enabled) {
      borderUsed ??= enabledBorder;
    }

    styleUsed ??= style;
    borderUsed ??= border;
    backgroundColorUsed ??= fillColor;

    // //? updating the line height to center the caret if the caret has a specified height.
    // final AppTextStyle textStyle;
    // if (caretHeight != null) {
    //   final textHeight = styleUsed!.fontSize! * styleUsed.lineHeight!;
    //   final heightDifference = textHeight - caretHeight;
    //   final newLineHeight =
    //       (caretHeight + heightDifference / 4) / initTextStyle.fontSize!;
    //   styleUsed = styleUsed.withStyle(lineHeight: newLineHeight);
    // } else {
    //   styleUsed = styleUsed;
    // }

    Widget result = AppContainer(
      padding: contentPadding,
      decoration: AppBoxDecoration(
        color: filled ? backgroundColorUsed : null,
        borderRadius: borderUsed?.borderRadiusValue,
        border: borderUsed?.toBorderBox(),
        shadows: shadows,
      ),
      child: AppRow(
        gap: contentGap,
        children: [
          prefixIconToUse,
          Expanded(
            child: TextField(
              cursorHeight: caretHeight?.compute(context, widgetConstraints),
              cursorWidth: caretWidth.compute(context, widgetConstraints),
              style: style?.compute(context, widgetConstraints),
              scrollPadding: scrollPadding.compute(context, widgetConstraints),
              maxLines: maxLines,
              minLines: minLines,
              maxLength: maxLength,
              maxLengthEnforcement: maxLengthEnforcement,
              textAlign: textAlign,
              focusNode: focusNode,
              controller: controller,
              autofocus: autoFocus,
              canRequestFocus: canRequestFocus,
              textCapitalization: textCapitalization,
              textDirection: textDirection,
              expands: expands,
              onSubmitted: onSubmitted,
              onEditingComplete: onEditingComplete,
              cursorColor: caretColor,
              onAppPrivateCommand: onAppPrivateCommand,
              textAlignVertical: textAlignVertical,
              keyboardAppearance: keyboardAppearance,
              keyboardType: keyboardType,
              decoration: InputDecoration.collapsed(
                hintStyle: hintStyle?.compute(context, widgetConstraints),
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
          suffixIconToUse,
        ],
      ),
    );

    result = MouseRegion(
      onEnter: onMouseEnter,
      onExit: onMouseExit,
      child: GestureDetector(
        onTap: onTap,
        child: result,
      ),
    );

    final labelToUse = label ??
        (labelText != null
            ? AppText(
                labelText,
                style: labelStyle,
              )
            : null);

    if (labelToUse != null) {
      result = AppColumn(
        gap: labelGap,
        children: [
          GestureDetector(
            onTap: onTap,
            child: labelToUse,
          ),
          result
        ],
      );
    }

    return result;
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    _controller?.dispose();

    super.dispose();
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [widget.caretHeight, widget.caretWidth].needsConstraints ||
        AppClass.anyNeedsConstraints([
          widget.decoration,
          widget.style,
          widget.scrollPadding,
        ], context);
  }
}
