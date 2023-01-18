import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids/app/Provider/app.providers.dart';
import 'package:kids/app/Routes/app.route.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../app/credentials/supabase.credentials.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color.fromARGB(255, 0, 0, 0),
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  await Supabase.initialize(
    url: SupaBaseCred.apiUrl,
    anonKey: SupaBaseCred.apiKey,
  );
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
      providers: AppProviders.providers,
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kids App',

            theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
              primaryColor: const Color(0xFF202328),
              backgroundColor: const Color.fromARGB(255, 30, 30, 30),
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                color: Color.fromARGB(255, 16, 255, 171),
              ),
            ),
            // home: const WelcomeScreen(),
            initialRoute: RoutePaths.welcomeScreen,
            onGenerateRoute: RoutePaths.generateRoute,
          );
        },
      ),
    );
  }
}
