import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/types/types.dart' as types;

import '../text/text.dart';

import './addons/addons.dart';

class AppTextField extends AppStatelessWidget {
  final List<String>? autofillHints;
  final types.InputCounterWidgetBuilder? buildCounter;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final types.EditableTextContextMenuBuilder? contextMenuBuilder;
  final TextEditingController? controller;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final UnitSize? cursorHeight;
  final bool? cursorOpacityAnimates;
  final AppInputDecoration? decoration;
  final bool? enableInteractiveSelection;
  final bool? enabled;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final MouseCursor? mouseCursor;
  final types.AppPrivateCommandCallback? onAppPrivateCommand;
  final types.VoidFunctionString? onChanged;
  final types.VoidFunction? onEditingComplete;
  final types.VoidFunctionString? onSubmitted;
  final types.VoidFunction? onTap;
  final types.PointerDownEventCallBack? onTapOutside;
  final String? restorationId;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final TextSelectionControls? selectionControls;
  final bool? showCursor;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final MaterialStatesController? statesController;
  final StrutStyle? strutStyle;
  final AppTextStyle? style;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final UndoHistoryController? undoController;

  final bool autoCorrect;
  final bool autoFocus;
  final bool canRequestFocus;
  final Clip clipBehavior;
  final UnitSize cursorWidth;
  final DragStartBehavior dragStartBehavior;
  final bool enableIMEPersonalizedLearning;
  final bool enableSuggestions;
  final bool expands;
  final bool obscureText;
  final String obscuringCharacter;
  final bool onTapAlwaysCalled;
  final bool readOnly;
  final bool scribbleEnabled;
  final AppEdgeInsets scrollPadding;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;

  const AppTextField({
    super.key,
    this.autofillHints,
    this.buildCounter,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    this.controller,
    this.cursorColor,
    this.cursorErrorColor,
    this.cursorHeight,
    this.cursorOpacityAnimates,
    this.decoration,
    this.enableInteractiveSelection,
    this.enabled,
    this.focusNode,
    this.inputFormatters,
    this.keyboardAppearance,
    this.keyboardType,
    this.magnifierConfiguration,
    this.maxLength,
    this.maxLengthEnforcement,
    this.maxLines,
    this.minLines,
    this.mouseCursor,
    this.onAppPrivateCommand,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.onTapOutside,
    this.restorationId,
    this.scrollController,
    this.scrollPhysics,
    this.selectionControls,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.spellCheckConfiguration,
    this.statesController,
    this.strutStyle,
    this.style,
    this.textAlignVertical,
    this.textDirection,
    this.textInputAction,
    this.undoController,
    this.autoCorrect = false,
    this.autoFocus = false,
    this.canRequestFocus = true,
    this.clipBehavior = Clip.hardEdge,
    this.cursorWidth = const Pixel(2),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableIMEPersonalizedLearning = true,
    this.enableSuggestions = true,
    this.expands = false,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.onTapAlwaysCalled = false,
    this.readOnly = false,
    this.scribbleEnabled = true,
    this.scrollPadding = const AppEdgeInsets.all(Pixel(20)),
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    //FIXME: the TextField always has an extra padding of some sort.
    return TextField(
      autocorrect: autoCorrect,
      autofillHints: autofillHints,
      autofocus: autoFocus,
      buildCounter: buildCounter,
      canRequestFocus: canRequestFocus,
      clipBehavior: clipBehavior,
      contentInsertionConfiguration: contentInsertionConfiguration,
      contextMenuBuilder: contextMenuBuilder,
      controller: controller,
      cursorColor: cursorColor,
      cursorErrorColor: cursorErrorColor,
      cursorHeight: cursorHeight?.compute(context, constraints),
      cursorOpacityAnimates: cursorOpacityAnimates,
      cursorWidth: cursorWidth.compute(context, constraints),
      decoration: decoration?.compute(context, constraints),
      dragStartBehavior: dragStartBehavior,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      enableInteractiveSelection: enableInteractiveSelection,
      enableSuggestions: enableSuggestions,
      enabled: enabled,
      expands: expands,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardAppearance: keyboardAppearance,
      keyboardType: keyboardType,
      magnifierConfiguration: magnifierConfiguration,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLines: maxLines,
      minLines: minLines,
      mouseCursor: mouseCursor,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      onAppPrivateCommand: onAppPrivateCommand,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onTap: onTap,
      onTapAlwaysCalled: onTapAlwaysCalled,
      onTapOutside: onTapOutside,
      readOnly: readOnly,
      restorationId: restorationId,
      scribbleEnabled: scribbleEnabled,
      scrollController: scrollController,
      scrollPadding: scrollPadding.compute(context, constraints),
      scrollPhysics: scrollPhysics,
      selectionControls: selectionControls,
      selectionHeightStyle: selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle,
      showCursor: showCursor,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      spellCheckConfiguration: spellCheckConfiguration,
      statesController: statesController,
      strutStyle: strutStyle,
      style: style?.compute(context, constraints),
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      textInputAction: textInputAction,
      undoController: undoController,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return UnitSize.anyNeedsConstraints([
          cursorHeight,
          cursorWidth,
        ]) ||
        decoration != null && decoration!.needsConstraints ||
        style != null && style!.needsConstraints ||
        scrollPadding.needsConstraints;
  }
}
