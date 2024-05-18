import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:optiway/viewmodels/auth_view_model.dart';
import 'package:optiway/viewmodels/login_view_model.dart';
import 'package:optiway/viewmodels/register_view_model.dart';
import 'package:optiway/views/home_page.dart';
import 'package:optiway/views/login_view.dart';
import 'package:optiway/views/register_view.dart';
import 'package:provider/provider.dart';


class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.pink,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return _buildAuthChild(context, authViewModel);
          }
        },
      ),
    );
  }

  Widget _buildAuthChild(BuildContext context, AuthViewModel viewModel) {
    if (viewModel.showLoginPage) {
      return LoginView(viewModel: LoginViewModel(authViewModel: viewModel));
    } else {
      return RegisterView(viewModel: RegisterViewModel(authViewModel: viewModel));
    }
  }
}
