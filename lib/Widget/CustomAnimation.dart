import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomPageRoute({this.child, this.direction = AxisDirection.right})
      : super(
          transitionDuration: Duration(seconds: 5),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  Widget buildTranstions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
          position: Tween<Offset>(begin: getBeginOffset(), end: Offset(0, 0))
              .animate(animation),
          child: child);

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.left:
        return Offset(-1, 0);
      case AxisDirection.right:
        return Offset(1, 0);
    }
  }
}
