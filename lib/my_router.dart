import 'package:flutter/material.dart';
import 'package:kids/Pages/login_student.dart';
import 'package:kids/Pages/login_teacher.dart';
import 'package:kids/Pages/welcome_screen.dart';
import 'package:kids/Pages/welcome_second_screen.dart';

import 'Pages/Home.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/second':
        return MaterialPageRoute(builder: (_) => const WelcomeSecondScreen());
      case '/login_student':
        return MaterialPageRoute(builder: (_) => const LoginStudent());
      case '/login_teacher':
        return MaterialPageRoute(builder: (_) => const LoginTeacher());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
