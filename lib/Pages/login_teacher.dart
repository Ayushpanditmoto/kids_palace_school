import 'package:flutter/material.dart';
import 'package:kids/Pages/Components/text_form_field.dart';
import 'package:kids/app/Routes/app.route.dart';
import 'package:provider/provider.dart';
import '../app/Provider/auth.provider.dart';

class LoginTeacher extends StatefulWidget {
  const LoginTeacher({super.key});

  @override
  State<LoginTeacher> createState() => _LoginTeacherState();
}

class _LoginTeacherState extends State<LoginTeacher> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();

  void submit(ctx, Map data) async {
    if (formKey.currentState!.validate()) {
      await Provider.of<Auth>(ctx, listen: false)
          .login(emailC.text, passwordC.text);
      Navigator.pushNamed(ctx, RoutePaths.teacherDashboard);
    }
  }

  @override
  void initState() {
    emailC = TextEditingController();
    passwordC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 0, 179),
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
            top: 65,
            left: 10,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 12, 0, 179),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Column(
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Text("Teacher Login",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 12, 0, 179),
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 100,
                        ),
                        TextEnterArea(
                          controller: emailC,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          hintText: 'Enter your Email',
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Please enter your Email';
                            }
                            if (!p0.contains('@')) {
                              return 'Please enter a valid Email';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextEnterArea(
                          controller: passwordC,
                          textInputAction: TextInputAction.next,
                          obscureText:
                              isPasswordVisible == false ? true : false,
                          hintText: 'Enter your Password',
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Please enter your Password';
                            }
                            if (p0.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible == false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Map<String, dynamic> data = {
                              'email': emailC.text,
                              'password': passwordC.text,
                            };
                            submit(context, data);
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 12, 0, 179),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RoutePaths.teacherDashboard);
                            },
                            child: const Text("Teacher Dashboard"))
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
                    color: Color.fromARGB(255, 12, 0, 179),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
