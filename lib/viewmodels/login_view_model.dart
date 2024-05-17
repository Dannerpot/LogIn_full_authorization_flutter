import 'package:flutter/material.dart';
import 'package:modern_login/viewmodels/auth_view_model.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;

  LoginViewModel({required AuthViewModel authViewModel}) : _authViewModel = authViewModel;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _authViewModel.signInWithEmailAndPassword(email, password);
  }

  void togglePages() {
    _authViewModel.togglePages();
  }
}
