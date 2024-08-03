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

  final int cardCount;
  final UnitSize listHeight;
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
    required this.name,
    required this.onSeeMore,
    required this.listHeight,
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
        _handleListShowCase(indentationToUse.horizontal / 2),
      ],
    );
  }

  Widget _handleListShowCase(UnitSize indentation) {
    if (AppObject.toBool(isLoading)) {
      return loading ??
          AppSizedBox(
            height: listHeight,
            width: 100.vw,
            child: const Center(
              child: AppText("Implement Loading for this cardList"),
            ),
          );
    }

    if (cardCount.logical) {
      return empty ??
          AppSizedBox(
            height: listHeight,
            width: 100.vw,
            child: Center(
              child: TextMd('No available items to display.'),
            ),
          );
    }

    final gapToUse = gap ?? .5.rem;

    // subtract the gap size because the list view will generate a Gap anyway.
    final indentationToUse = indentation - gapToUse;
    return AppListView.separated(
      scrollDirection: Axis.horizontal,
      gap: gapToUse,
      itemCount: cardCount + 2,
      itemBuilder: (context, index) {
        if (index == 0) return GapHorizontal(size: indentationToUse);
        if (index == cardCount + 1) {
          return GapHorizontal(
            size: indentationToUse,
          );
        }
        return cardBuilder(context, index - 1);
      },
    );
  }
}
