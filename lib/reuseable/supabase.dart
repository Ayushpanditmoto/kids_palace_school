import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBase {
  // Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(
  //   url: 'YOUR_SUPABASE_URL',
  //   anonKey: 'YOUR_SUPABASE_ANON_KEY',
  // );
  // runApp(MyApp());
  // }
  static SupabaseClient supabase = Supabase.instance.client;

  static String url = 'https://rrevxnlwzfmzreprtolr.supabase.co';
  static String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJyZXZ4bmx3emZtenJlcHJ0b2xyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTczNDcxNzcsImV4cCI6MTk3MjkyMzE3N30.-Ni8C9J-HwaN8LNXU0HiIsk5HoGUfkZvKjoBWviDszE';

  static void supaBaseInit() async {
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );
  }

//make a optional parameter function

  //Sign up a new user
  static Future<void> signUp({
    String? email,
    String? password,
  }) async {
    AuthResponse response = await supabase.auth.signUp(
      email: email,
      password: password!,
    );

    print(response.session!.user.email);
  }
}
