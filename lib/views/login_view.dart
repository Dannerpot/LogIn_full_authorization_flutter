import 'package:flutter/material.dart';
import 'package:optiway/components/my_button.dart';
import 'package:optiway/components/my_textfield.dart';
import 'package:optiway/viewmodels/login_view_model.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel viewModel;

  LoginView({super.key, required this.viewModel});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              hintText: 'Email',
              onChanged: (value) => _emailController.text = value,
              controller: _emailController, obscureText: false,
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
              }, onTap: () {  },
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
