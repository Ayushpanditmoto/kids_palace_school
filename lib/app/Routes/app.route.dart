import 'package:flutter/material.dart';
import 'package:kids/Pages/Home.dart';
import 'package:kids/Pages/login_student.dart';
import 'package:kids/Pages/login_teacher.dart';
import 'package:kids/Pages/online_admission.dart';
import 'package:kids/Pages/studentdashboard/student_dashboard.dart';
import 'package:kids/Pages/teacher_dashboard.dart';
import 'package:kids/Pages/welcome_screen.dart';
import 'package:kids/Pages/welcome_second_screen.dart';

import '../../Pages/studentdashboard/student_fees.dart';
import '../../Pages/studentdashboard/student_notice.dart';

class RoutePaths {
  static const String welcomeScreen = '/';
  static const String home = '/home';
  static const String welcomeSecondScreen = '/second';
  static const String loginStudent = '/login_student';
  static const String loginTeacher = '/login_teacher';
  static const String onlineAdmission = '/online_admission';
  static const String teacherDashboard = '/teacher_dashboard';
  static const String studentDashboard = '/student_dashboard';
  static const String studentNotice = '/student_notice';
  static const String studentFees = '/student_fees';

  static final routes = {
    welcomeScreen: (BuildContext context) => const WelcomeScreen(),
    home: (BuildContext context) => const Home(),
    welcomeSecondScreen: (BuildContext context) => const WelcomeSecondScreen(),
    loginStudent: (BuildContext context) => const LoginStudent(),
    loginTeacher: (BuildContext context) => const LoginTeacher(),
    onlineAdmission: (BuildContext context) => const OnlineAdmission(),
    teacherDashboard: (BuildContext context) => const TeacherDashboard(),
    studentDashboard: (BuildContext context) => const StudentDashboard(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const Home());
      case RoutePaths.welcomeSecondScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeSecondScreen());
      case RoutePaths.loginStudent:
        return MaterialPageRoute(builder: (_) => const LoginStudent());
      case RoutePaths.loginTeacher:
        return MaterialPageRoute(builder: (_) => const LoginTeacher());
      case RoutePaths.onlineAdmission:
        return MaterialPageRoute(builder: (_) => const OnlineAdmission());
      case RoutePaths.teacherDashboard:
        return MaterialPageRoute(builder: (_) => const TeacherDashboard());
      case RoutePaths.studentDashboard:
        return MaterialPageRoute(builder: (_) => const StudentDashboard());
      case RoutePaths.studentNotice:
        return MaterialPageRoute(builder: (_) => const StudentNotice());
      case RoutePaths.studentFees:
        return MaterialPageRoute(builder: (_) => const StudentFees());
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
