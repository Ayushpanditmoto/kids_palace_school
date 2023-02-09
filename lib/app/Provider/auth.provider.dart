import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../credentials/supabase.credentials.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _authTimer;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String? get userId {
    return _userId;
  }

  Future<void> _authenticate(
    String email,
    String password,
    bool isSignup,
  ) async {
    try {
      if (isSignup) {
        AuthResponse response = await SupaBaseCred.client.auth.signUp(
          email: email,
          password: password,
        );
        print(response.session!.user.emailConfirmedAt);
      } else {
        AuthResponse response =
            await SupaBaseCred.client.auth.signInWithPassword(
          email: email,
          password: password,
        );
        _token = response.session!.accessToken;
        _userId = response.session!.user.id;
        _expiryDate = DateTime.now().add(
          Duration(
            seconds: response.session!.expiresIn!.toInt(),
          ),
        );
        _autoLogout();
        notifyListeners();
        final prefs = SharedPreferences.getInstance();
        final userData = json.encode({
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate!.toIso8601String(),
        });
        prefs.then((value) {
          value.setString('userData', userData);
        });

        return Future.value();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, true);
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, false);
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'] as String);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'] as String;
    _userId = extractedUserData['userId'] as String;
    _expiryDate = expiryDate;
    notifyListeners();
    return true;
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
