// auth_view.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modern_login/viewmodels/auth_view_model.dart';
import 'package:modern_login/views/login_view.dart';
import 'package:modern_login/views/register_view.dart';

class AuthView extends StatelessWidget {
  final AuthViewModel viewModel;

  AuthView({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeView();
          } else {
            return LoginOrRegisterView(onTap: viewModel.togglePages);
          }
        },
      ),
    );
  }
}
