import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/types/types.dart' as types;

class AppTextField extends AppStatelessWidget {
  final UnitSize? cursorHeight;
  final AppInputDecoration? decoration;
  final AppTextStyle? style;
  final List<String>? autofillHints;
  final types.InputCounterWidgetBuilder? buildCounter;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final types.EditableTextContextMenuBuilder? contextMenuBuilder;
  final TextEditingController? controller;
  final Color? cursorColor, cursorErrorColor;
  final bool? cursorOpacityAnimates, enableInteractiveSelection, enabled;
  final bool? showCursor;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final int? maxLength, maxLines, minLines;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final MouseCursor? mouseCursor;
  final types.AppPrivateCommandCallback? onAppPrivateCommand;
  final types.VoidFunctionString? onChanged, onSubmitted;
  final types.VoidFunction? onEditingComplete, onTap;
  final types.PointerDownEventCallBack? onTapOutside;
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

  final UnitSize cursorWidth;
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

  const AppTextField({
    super.key,
    this.cursorHeight,
    this.decoration,
    this.style,
    this.autofillHints,
    this.buildCounter,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    this.controller,
    this.cursorColor,
    this.cursorErrorColor,
    this.cursorOpacityAnimates,
    this.enableInteractiveSelection,
    this.enabled,
    this.showCursor,
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
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.onTapOutside,
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
    this.cursorWidth = const Pixel(2),
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
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    //FIXME: the TextField always has an extra padding of some sort.
    return TextField(
      cursorHeight: cursorHeight?.compute(context, constraints),
      decoration: decoration?.compute(context, constraints),
      style: style?.compute(context, constraints),
      cursorWidth: cursorWidth.compute(context, constraints),
      scrollPadding: scrollPadding.compute(context, constraints),
      autofillHints: autofillHints,
      buildCounter: buildCounter,
      contentInsertionConfiguration: contentInsertionConfiguration,
      contextMenuBuilder: contextMenuBuilder,
      controller: controller,
      cursorColor: cursorColor,
      cursorErrorColor: cursorErrorColor,
      cursorOpacityAnimates: cursorOpacityAnimates,
      enableInteractiveSelection: enableInteractiveSelection,
      enabled: enabled,
      showCursor: showCursor,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardAppearance: keyboardAppearance,
      keyboardType: keyboardType,
      magnifierConfiguration: magnifierConfiguration,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      maxLengthEnforcement: maxLengthEnforcement,
      mouseCursor: mouseCursor,
      onAppPrivateCommand: onAppPrivateCommand,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      onTapOutside: onTapOutside,
      restorationId: restorationId,
      scrollController: scrollController,
      scrollPhysics: scrollPhysics,
      selectionControls: selectionControls,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      spellCheckConfiguration: spellCheckConfiguration,
      statesController: statesController,
      strutStyle: strutStyle,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      textInputAction: textInputAction,
      undoController: undoController,
      autocorrect: autoCorrect,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      enableSuggestions: enableSuggestions,
      expands: expands,
      autofocus: autoFocus,
      canRequestFocus: canRequestFocus,
      obscureText: obscureText,
      onTapAlwaysCalled: onTapAlwaysCalled,
      readOnly: readOnly,
      scribbleEnabled: scribbleEnabled,
      clipBehavior: clipBehavior,
      dragStartBehavior: dragStartBehavior,
      obscuringCharacter: obscuringCharacter,
      selectionHeightStyle: selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [cursorHeight, cursorWidth].needsConstraints ||
        AppClass.anyNeedsConstraints([decoration, style, scrollPadding]);
  }
}
