import 'package:flutter/material.dart';

class PageFadeTransition extends PageRouteBuilder<void> {
  PageFadeTransition({
    @required this.child,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return child;
            },
            transitionDuration: duration,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(opacity: animation, child: child);
            });

  final Widget child;
  final Duration duration;
}
