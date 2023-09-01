import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/src/ui/home_page.dart';
import 'package:smart_home/src/ui/main_wrapper.dart';

CustomTransitionPage withCustomAnimation(
    GoRouterState state, Widget child, int selectedIndex) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: MainWrapper(
      selectedIndex: selectedIndex,
      child: child,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return withCustomAnimation(state, const HomePage(), 0);
      },
    ),
  ],
);
