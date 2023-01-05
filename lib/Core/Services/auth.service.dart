import 'package:kids/app/credentials/supabase.credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  Future<String?> signup({
    required String email,
    required String password,
  }) async {
    try {
      AuthResponse response = await SupabaseCredentials.client.auth.signUp(
        email: email,
        password: password,
      );

      print("signup response: $response");
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      AuthResponse response =
          await SupabaseCredentials.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      print("login response: $response");
    } catch (e) {
      print(e);
    }
    return null;
  }
}
