import 'package:flutter/material.dart';
import 'package:modern_login/viewmodels/login_view_model.dart';
import 'package:modern_login/widgets/my_button.dart';
import 'package:modern_login/widgets/my_textfield.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel viewModel;

  LoginView({required this.viewModel});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              hintText: 'Email',
              onChanged: (value) => _emailController.text = value,
              controller: _emailController,
            ),
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              onChanged: (value) => _passwordController.text = value,
              controller: _passwordController,
            ),
            MyButton(
              text: 'Sign In',
              onPressed: () async {
                // Get email and password from controllers
                final email = _emailController.text;
                final password = _passwordController.text;

                // Call sign-in method from view model
                await viewModel.signInWithEmailAndPassword(email, password);
              },
            ),
            TextButton(
              onPressed: () {
                viewModel.togglePages();
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
