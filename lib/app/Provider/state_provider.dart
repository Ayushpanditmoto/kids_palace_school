import 'package:flutter/material.dart';

class HandleState with ChangeNotifier {
  bool loading = false;
  bool error = false;
  String errorMessage = '';
  bool success = false;
  String successMessage = '';

  bool get isLoading => loading;
  bool get isError => error;
  String get getErrorMessage => errorMessage;
  bool get isSuccess => success;
  String get getSuccessMessage => successMessage;

  void setLoading(bool value) {
    loading = value;
    error = false;
    success = false;
    notifyListeners();
  }

  void setError(String message) {
    loading = false;
    error = true;
    errorMessage = message;
    success = false;
    notifyListeners();
  }

  void setSuccess(String message) {
    loading = false;
    error = false;
    success = true;
    successMessage = message;
    notifyListeners();
  }

  void reset() {
    loading = false;
    error = false;
    success = false;
    notifyListeners();
  }

  void resetError() {
    error = false;
    notifyListeners();
  }

  void resetSuccess() {
    success = false;
    notifyListeners();
  }

  void resetLoading() {
    loading = false;
    notifyListeners();
  }

  void resetAll() {
    loading = false;
    error = false;
    success = false;
    notifyListeners();
  }
}
