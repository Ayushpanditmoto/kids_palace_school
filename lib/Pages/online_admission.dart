import 'package:flutter/material.dart';
import 'package:kids/Pages/Components/text_form_field.dart';

class OnlineAdmission extends StatelessWidget {
  const OnlineAdmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 255, 205),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 20,
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
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 50,
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
            top: 50,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Column(
                children: <Widget>[
                  Form(
                    child: Column(
                      children: [
                        const Text("Online Admission",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 16, 255, 171),
                              fontWeight: FontWeight.bold,
                            )),
                        const TextEnterArea(
                          hintText: 'Enter your Full Name',
                          labelText: 'Name',
                        ),
                        const TextEnterArea(
                          hintText: 'Enter your email',
                          labelText: 'Email',
                        ),
                        const TextEnterArea(
                          hintText: 'Enter your Guardian Name',
                          labelText: 'Guardian Name',
                        ),
                        const TextEnterArea(
                          hintText: 'Enter your Phone Number',
                          labelText: 'Phone',
                        ),
                        const TextEnterArea(
                          hintText: 'Enter your Address',
                          labelText: 'Address',
                        ),
                        const TextEnterArea(
                          hintText: 'Enter your Date of Birth',
                          labelText: 'Date of Birth',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 0, 167, 109),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: const Text(
                            'Apply Now',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ),
          const Positioned(
              left: 20,
              right: 20,
              bottom: 20,
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
      ),
    );
  }
}
