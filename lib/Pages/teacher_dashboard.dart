// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kids/Pages/welcome_screen.dart';
import 'package:kids/app/Provider/auth.provider.dart';
import 'package:provider/provider.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await Provider.of<Auth>(context, listen: false).logout();

              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const WelcomeScreen();
                },
              ));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Teacher Dashboard'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
