import 'package:flutter/material.dart';
import 'package:kids/Pages/Components/text_form_field.dart';

class LoginTeacher extends StatefulWidget {
  const LoginTeacher({super.key});

  @override
  State<LoginTeacher> createState() => _LoginTeacherState();
}

class _LoginTeacherState extends State<LoginTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Teacher'),
            Form(
              child: Column(
                children: [
                  const TextEnterArea(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                  const TextEnterArea(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Login'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
