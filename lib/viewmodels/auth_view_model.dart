import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modern_login/services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _showLoginPage = true;

  bool get showLoginPage => _showLoginPage;

  void togglePages() {
    _showLoginPage = !_showLoginPage;
    notifyListeners();
  }

  Future<UserCredential?> signInWithGoogle() async {
    return await _authService.signInWithGoogle();
  }

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    return await _authService.signInWithEmailAndPassword(email, password);
  }

  Future<UserCredential?> createAccountWithEmailAndPassword(String email, String password) async {
    return await _authService.createAccountWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
