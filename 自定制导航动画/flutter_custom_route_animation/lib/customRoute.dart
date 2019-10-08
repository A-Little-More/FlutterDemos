import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  Widget child;
  int duration;
  String type;
  FadeRoute({
    @required this.child,
    @required this.type,
    this.duration = 200,
  }): super(
    transitionDuration: Duration(milliseconds: duration),
    pageBuilder: (context, animation1, animation2) {
      return child;
    },
    transitionsBuilder: (context, animation1, animation2, child) {
      if (type == "Scale") {
        return ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn
            ),
          ),
          child: child,
        );
      } else if (type == "ScaleAndRotate") {
        return ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn
            ),
          ),
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn
              ),
            ),
            child: child,
          ),
        );
      } else if (type == "Slide") {
        return SlideTransition(
          position: Tween(
            begin: Offset(-1.0, 0.0),
            end: Offset(0.0, 0.0)
          ).animate(
            CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn
            ),
          ),
          child: child,
        );
      } else {
        return FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn
            ),
          ),
          child: child,
        );
      }
    }
  );
}

