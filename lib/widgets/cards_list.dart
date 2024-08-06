import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

import './texts/texts.dart';

class CardsList<T> extends StatelessWidget {
  final UnitSize? gap;
  final AppEdgeInsetsGeometry? indentation;
  final ButtonStyle? seeMoreStyle;
  final Widget? loading, empty;

  final bool? isLoading;
  final String? seeMoreText;
  final Color nameColor, seeMoreTextColor;

  final UnitSize listHeight;
  final int cardCount;
  final String name;
  final NullableIndexedWidgetBuilder cardBuilder;
  final void Function() onSeeMore;

  const CardsList({
    super.key,
    this.seeMoreStyle,
    this.loading,
    this.empty,
    this.gap,
    this.isLoading,
    this.indentation,
    this.seeMoreText,
    this.seeMoreTextColor = AppColors.brand700,
    this.nameColor = AppColors.gray900,
    required this.listHeight,
    required this.name,
    required this.onSeeMore,
    required this.cardCount,
    required this.cardBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final indentationToUse = indentation ??
        AppEdgeInsets.symmetric(
          horizontal: 1.rem,
        );

    return AppColumn(
      gap: .25.rem,
      children: [
        AppPadding(
          padding: AppEdgeInsets.symmetric(
            vertical: 1.25.rem,
            horizontal: indentationToUse.horizontal / 2,
          ),
          child: AppRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextMd.semiBold(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle(
                    color: nameColor,
                  ),
                ),
              ),
              AppTextButton(
                onPressed: onSeeMore,
                text: TextSm.medium(
                  seeMoreText ?? "View All",
                  style: AppTextStyle(
                    color: seeMoreTextColor,
                    lineHeight: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
        _handleListShowCase(indentationToUse),
      ],
    );
  }

  Widget _handleListShowCase(AppEdgeInsetsGeometry indentation) {
    Widget result;

    if (AppObject.toBool(isLoading)) {
      result = loading ??
          const Center(
            child: AppText("Implement Loading for this cardList"),
          );
    } else if (!cardCount.logical) {
      result = empty ??
          Center(
            child: TextMd('No available items to display.'),
          );
    } else {
      result = AppListView.separated(
        padding: indentation,
        scrollDirection: Axis.horizontal,
        gap: gap ?? .5.rem,
        itemCount: cardCount,
        itemBuilder: cardBuilder,
      );
    }

    return AppSizedBox(
      height: listHeight,
      width: 100.vw,
      child: result,
    );
  }
}
