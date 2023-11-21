import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeThroughTransitionWrapper extends CustomTransitionPage {
  FadeThroughTransitionWrapper({required super.child})
      : super(
            transitionsBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation, Widget child) =>
                FadeThroughTransition(animation: animation, secondaryAnimation: secondaryAnimation, child: child));
}
