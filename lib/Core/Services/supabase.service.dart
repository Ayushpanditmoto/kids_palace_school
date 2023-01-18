import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../app/credentials/supabase.credentials.dart';
import '../../Pages/Components/show_snackbar.dart';

class AuthService {
  Future<void> signUp(String email, String password) async {
    try {
      AuthResponse response = await SupaBaseCred.client.auth
          .signUp(password: password, email: email);
    } catch (e) {
      print(e);
    }
  }
}
