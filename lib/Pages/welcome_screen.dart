import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 211, 168),
      body: Stack(children: <Widget>[
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
          top: 250,
          left: 0,
          child: SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    'assets/images/welcome.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Welcome to Kids Palace',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 22, 194, 134),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'School',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(145, 47, 255, 182),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    // //slide down animation
                    // Navigator.push(
                    //     context,
                    //     PageRouteBuilder(
                    //         pageBuilder: (context, animation1, animation2) =>
                    //             const WelcomeSecondScreen(),
                    //         transitionDuration:
                    //             const Duration(milliseconds: 400),
                    //         transitionsBuilder:
                    //             (context, animation1, animation2, child) =>
                    //                 SlideTransition(
                    //                   position: Tween<Offset>(
                    //                     begin: const Offset(1, 0),
                    //                     end: Offset.zero,
                    //                   ).animate(animation1),
                    //                   child: child,
                    //                 )));
                    Navigator.pushNamed(context, '/second');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(179, 0, 197, 128),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(200, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
        const Positioned(
            top: 520,
            left: 100,
            right: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'By continuing, you agree to our Terms of Service and Privacy Policy',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(145, 16, 255, 171),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ]),
    );
  }
}
