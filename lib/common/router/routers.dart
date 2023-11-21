import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transition_animations_example/common/router/transitions_animatuions.dart/fade_through_transition_wrapper.dart';
import 'package:transition_animations_example/common/router/transitions_animatuions.dart/shared_axis_transition_wrapper.dart';
import 'package:transition_animations_example/presentation/first_page/first_page.dart';
import 'package:transition_animations_example/presentation/first_page/secondary_first_page.dart';
import 'package:transition_animations_example/presentation/home_page/home_page.dart';
import 'package:transition_animations_example/presentation/second_page/second_page.dart';
import 'package:transition_animations_example/presentation/third_page/secondary_third_page.dart';
import 'package:transition_animations_example/presentation/third_page/third_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final firstPageKey = GlobalKey<NavigatorState>();
final secondPageKey = GlobalKey<NavigatorState>();
final thirdPageKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/first_page',
    debugLogDiagnostics: true,
    routerNeglect: true,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, child) => HomePage(state: state, child: child),
          branches: [
            StatefulShellBranch(navigatorKey: firstPageKey, routes: [
              GoRoute(path: '/first_page', name: 'first_page', builder: (context, state) => const FirstPage(), routes: [
                GoRoute(
                    path: 'secondary_first_page',
                    name: 'secondary_first_page',
                    pageBuilder: (context, state) {
                      final extra = state.extra as Map<String, Object>;
                      return FadeThroughTransitionWrapper(child: SecondaryFirstPage(text: extra['text'] as String));
                    })
              ]),
            ]),
            StatefulShellBranch(navigatorKey: secondPageKey, routes: [
              GoRoute(path: '/second_page', name: 'second_page', builder: (context, state) => const SecondPage())
            ]),
            StatefulShellBranch(navigatorKey: thirdPageKey, routes: [
              GoRoute(path: '/third_page', name: 'third_page', builder: (context, state) => const ThirdPage(), routes: [
                GoRoute(
                    path: 'secondary_third_page',
                    name: 'secondary_third_page',
                    pageBuilder: (context, state) => SharedAxisTransitionWrapper(child: const SecondaryThirdPage()))
              ])
            ])
          ])
    ]);
