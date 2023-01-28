import 'package:flutter/material.dart';

class Navigation {
  // this will be used to push a new page
  static void push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  // this will be used to push a new page and remove the previous page
  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  // this will be used to pop the current page
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  //without animation page push
  static void pushWithoutAnimation(BuildContext context, Widget page) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(
              milliseconds: 0,
            ),
            pageBuilder: (context, animation, secondaryAnimation) => page));
  }

  //push with beautiful animation
  static void pushWithAnimation(BuildContext context, Widget page) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(
              milliseconds: 300,
            ),
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            }));
  }
}
