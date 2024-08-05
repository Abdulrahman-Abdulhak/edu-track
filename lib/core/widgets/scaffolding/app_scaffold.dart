import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../_main/main.dart';
import '../../utils/utils.dart';
import '../../types/types.dart';

class AppScaffold extends AppStatelessWidget {
  final AppPreferredSizeWidget? appBar;
  final Color? backgroundColor;
  //TODO: complete the use of the unused properties.
  final Widget? body, drawer, bottomNavigationBar, floatingActionButton;

  //? Router Params
  final List<PageRouteInfo>? routes;
  final AnimatedIndexedStackBuilder? builder;
  final AnimatedIndexedStackTransitionBuilder? transitionBuilder;
  final FloatingActionButtonBuilder? floatingActionButtonBuilder;
  final AppHeaderNavBuilder? appBarBuilder;
  final BottomNavigationBuilder? bottomNavigationBuilder;

  final Curve transitionCurve;
  final Duration animationDuration;
  final bool lazyLoad;
  final int homeIndex;
  final NavigatorObserversBuilder navigatorObservers;
  final bool inheritNavigatorObservers;

  final bool _intersected;

  const AppScaffold({
    super.key,
    this.backgroundColor,
    this.appBar,
    this.body,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    // router params
    this.routes,
    this.builder,
    this.transitionBuilder,
    this.floatingActionButtonBuilder,
    this.appBarBuilder,
    this.bottomNavigationBuilder,
    this.transitionCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.lazyLoad = true,
    this.homeIndex = -1,
    this.navigatorObservers =
        AutoRouterDelegate.defaultNavigatorObserversBuilder,
    this.inheritNavigatorObservers = true,
  }) : _intersected = false;

  const AppScaffold.intersect({
    super.key,
    this.backgroundColor,
    this.appBar,
    this.body,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    // router params
    this.routes,
    this.builder,
    this.transitionBuilder,
    this.floatingActionButtonBuilder,
    this.appBarBuilder,
    this.bottomNavigationBuilder,
    this.transitionCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.lazyLoad = true,
    this.homeIndex = -1,
    this.navigatorObservers =
        AutoRouterDelegate.defaultNavigatorObserversBuilder,
    this.inheritNavigatorObservers = true,
  }) : _intersected = true;

  @override
  Widget compute(BuildContext context, BoxConstraints? constraints) {
    // remake of the properties in case of [AppScaffold.intersect]
    final appBar = _intersected ? null : this.appBar;
    final drawer = _intersected ? null : this.drawer;
    final bottomNavigationBar = _intersected ? null : this.bottomNavigationBar;
    final floatingActionButton =
        _intersected ? null : this.floatingActionButton;

    final body = _intersected
        ? Stack(
            children: [
              if (this.body != null) this.body!,
              if (this.appBar != null) Positioned(top: 0, child: this.appBar!),
              if (this.bottomNavigationBar != null)
                Positioned(bottom: 0, child: this.bottomNavigationBar!),
            ],
          )
        : this.body;

    if (routes != null) {
      return AutoTabsRouter(
        key: key,
        routes: routes,
        duration: animationDuration,
        lazyLoad: lazyLoad,
        homeIndex: homeIndex,
        navigatorObservers: navigatorObservers,
        inheritNavigatorObservers: inheritNavigatorObservers,
        curve: transitionCurve,
        transitionBuilder: (context, child, animation) =>
            transitionBuilder?.call(context, child, animation) ??
            FadeTransition(
              opacity: animation,
              child: child,
            ),
        builder: (context, child) {
          final tabsRouter = context.tabsRouter;
          return AppScaffold(
            backgroundColor: backgroundColor,
            drawer: drawer,
            floatingActionButton: floatingActionButton ??
                floatingActionButtonBuilder?.call(
                  context,
                  tabsRouter,
                ),
            appBar: appBar ??
                appBarBuilder?.call(
                  context,
                  tabsRouter,
                ),
            body: body ?? builder?.call(context, child),
            bottomNavigationBar: bottomNavigationBar ??
                bottomNavigationBuilder?.call(
                  context,
                  tabsRouter,
                ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar?.compute(context, constraints),
      body: body,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [appBar].needsConstraints(context);
  }
}
