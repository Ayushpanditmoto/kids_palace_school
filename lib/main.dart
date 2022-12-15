import 'package:flutter/material.dart';

import 'Pages/Home.dart';
import 'package:provider/provider.dart';

import 'Provider/ThemeProvider.dart';
import 'my_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Kids App',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.amber,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                color: Colors.purple,
              ),
            ),
            home: const Home(),
            initialRoute: "/",
            onGenerateRoute: MyRouter.generateRoute,
          );
        },
      ),
    );
  }
}
