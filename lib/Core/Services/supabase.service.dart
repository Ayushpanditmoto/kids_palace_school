import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../app/credentials/supabase.credentials.dart';

class AuthService {
  Future<void> signUp(String email, String password) async {
    try {
      AuthResponse response = await SupaBaseCred.client.auth.signUp(
        email: email,
        password: password,
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      AuthResponse response = await SupaBaseCred.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print(response.session!.user.email);
    } catch (e) {
      print(e);
    }
  }
}
