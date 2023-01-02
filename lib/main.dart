import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids/Pages/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color.fromARGB(255, 0, 0, 0),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kids App',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
              primaryColor: const Color(0xFF202328),
              backgroundColor: const Color.fromARGB(255, 30, 30, 30),
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                color: Color.fromARGB(255, 16, 255, 171),
              ),
            ),
            // darkTheme: ThemeData(
            //   primaryColor: const Color(0xFF202328),
            //   backgroundColor: const Color(0xFF12171D),
            //   brightness: Brightness.dark,
            //   appBarTheme: const AppBarTheme(
            //     color: Colors.purple,
            //   ),
            // ),
            // home: const Home(),
            // home: const WelcomeSecondScreen(),
            home: const WelcomeScreen(),
            initialRoute: "/",
            onGenerateRoute: MyRouter.generateRoute,
          );
        },
      ),
    );
  }
}
