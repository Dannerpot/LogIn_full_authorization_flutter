import 'package:flutter/material.dart';
import 'package:optiway/viewmodels/auth_view_model.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;

  RegisterViewModel({required AuthViewModel authViewModel}) : _authViewModel = authViewModel;

  Future<void> createAccountWithEmailAndPassword(String email, String password) async {
    await _authViewModel.createAccountWithEmailAndPassword(email, password);
  }

  void togglePages() {
    _authViewModel.togglePages();
  }
}
