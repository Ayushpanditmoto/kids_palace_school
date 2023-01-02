// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/ThemeProvider.dart';
import 'Components/home_components.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kids Palace School'),
          centerTitle: true,
          actions: [
            ActionChip(
                label: themeProvider.themeMode == ThemeMode.light
                    ? const Text('Light')
                    : const Text('Dark'),
                onPressed: () {
                  if (themeProvider.themeMode == ThemeMode.light) {
                    themeProvider.setThemeMode(ThemeMode.dark);
                  } else {
                    themeProvider.setThemeMode(ThemeMode.light);
                  }
                }),
          ],
        ),
        drawer: Drawer(
            backgroundColor: Colors.blueGrey[900], child: const Text('Drawer')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            physics: const ScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              HomeCard(
                title: 'Attendance',
                image: 'assets/home/book.png',
              ),
              HomeCard(
                title: 'Attendance',
                image: './assets/home/school.png',
              ),
              HomeCard(
                title: 'Attendance',
                image: './assets/home/binder.png',
              ),
              HomeCard(
                title: 'Attendance',
                image: './assets/home/ebook.png',
              ),
              HomeCard(
                title: 'Attendance',
                image: './assets/home/report-card.png',
              ),
              HomeCard(
                title: 'Attendance',
                image: './assets/home/video-conference.png',
              ),
            ],
          ),
        ));
  }
}
