import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kids/enum_route.dart';

class WelcomeSecondScreen extends StatelessWidget {
  const WelcomeSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 204, 155),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                  offset: Offset(0, 5),
                ),
              ],
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
              top: 100,
              left: 100,
              right: 100,
              // bottom: 250,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.loginStudent);
                },
                child: Container(
                  height: 170,
                  width: 400,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                    color: Color.fromARGB(255, 0, 184, 120),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      children: const [
                        Icon(
                          FontAwesomeIcons.userGraduate,
                          size: 80,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Student Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 227, 227, 227),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 300,
              left: 100,
              right: 100,
              // bottom: 250,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.loginTeacher);
                },
                child: Container(
                  height: 170,
                  width: 400,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      children: const [
                        Icon(
                          FontAwesomeIcons.personChalkboard,
                          size: 80,
                          color: Color.fromARGB(255, 193, 193, 193),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Teacher Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 16, 255, 171),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 500,
              left: 100,
              right: 100,
              // bottom: 250,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.loginTeacher);
                },
                child: Container(
                  height: 100,
                  width: 500,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutePaths.onlineAdmission);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 184, 120),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Online Admission',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
