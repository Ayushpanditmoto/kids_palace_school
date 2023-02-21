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
  bool isTeacher = false;

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

  bool get isTeacherLogin {
    final prefs = SharedPreferences.getInstance();
    prefs.then((value) {
      isTeacher = value.getBool('isTeacher')!;
    });
    return isTeacher;
  }

  Future<void> _authenticate(
    String email,
    String password,
    bool isSignup,
    bool isTeacher,
  ) async {
    try {
      if (isSignup) {
        await SupaBaseCred.client.auth.signUp(
          email: email,
          password: password,
        );
        Builder(
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('User created successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        );
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
          value.setBool('isTeacher', isTeacher);
        });

        return Future.value();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, true, isTeacher);
  }

  Future<void> studentlogin(String email, String password) async {
    return _authenticate(email, password, false, isTeacher = false);
  }

  Future<void> teacherlogin(String email, String password) async {
    return _authenticate(email, password, false, isTeacher = true);
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    isTeacher = false;
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
    final isTeacherLogin = prefs.getBool('isTeacher')!;
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'] as String);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'] as String;
    _userId = extractedUserData['userId'] as String;
    _expiryDate = expiryDate;
    isTeacher = isTeacherLogin;
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
