import 'package:flutter/material.dart';

import '../../_main/main.dart';
import '../../utils/utils.dart';
import '../../types/types.dart';

typedef DropdownMenuSearchCallback<T> = int? Function(
  List<DropdownMenuEntry<T>> entries,
  String query,
);

class AppDropdownMenu<T> extends AppStatelessWidget {
  final UnitSize? width, menuHeight;
  final AppEdgeInsets? expandedInsets;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? trailingIcon, leadingIcon, label;
  final String? errorText, hintText, helperText;
  final bool? requestFocusOnTap;
  final T? initialSelection;
  final VoidFunctionT<T?>? onSelected;
  final DropdownMenuSearchCallback<T>? searchCallback;

  final bool enableFilter, enableSearch, enabled;

  final List<DropdownMenuEntry<T>> dropdownMenuEntries;

  const AppDropdownMenu({
    super.key,
    this.width,
    this.menuHeight,
    this.expandedInsets,
    this.controller,
    this.focusNode,
    this.trailingIcon,
    this.leadingIcon,
    this.label,
    this.errorText,
    this.hintText,
    this.helperText,
    this.requestFocusOnTap,
    this.initialSelection,
    this.onSelected,
    this.searchCallback,
    this.enableFilter = false,
    this.enableSearch = true,
    this.enabled = true,
    required this.dropdownMenuEntries,
  });

  @override
  Widget compute(BuildContext context, BoxConstraints? constraints) {
    return DropdownMenu<T>(
      width: width?.compute(context, constraints),
      menuHeight: menuHeight?.compute(context, constraints),
      expandedInsets: expandedInsets?.compute(context, constraints),
      dropdownMenuEntries: dropdownMenuEntries,
      initialSelection: initialSelection,
      enableFilter: enableFilter,
      enableSearch: enableSearch,
      enabled: enabled,
      errorText: errorText,
      hintText: hintText,
      helperText: helperText,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      label: label,
      controller: controller,
      focusNode: focusNode,
      onSelected: onSelected,
      requestFocusOnTap: requestFocusOnTap,
      searchCallback: searchCallback,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [width, menuHeight].needsConstraints ||
        [expandedInsets].needsConstraints(context);
  }
}
