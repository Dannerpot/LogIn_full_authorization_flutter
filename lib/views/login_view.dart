import 'package:flutter/material.dart';
import 'package:modern_login/viewmodels/login_view_model.dart';
import 'package:modern_login/widgets/my_button.dart';
import 'package:modern_login/widgets/my_textfield.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel viewModel;

  LoginView({required this.viewModel});

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
              onChanged: (value) {}, controller: TextEditingController(), // Implement your logic
            ),
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              onChanged: (value) {}, controller: TextEditingController(), // Implement your logic
            ),
            MyButton(
              text: 'Sign In',
              onPressed: () {}, // Implement your logic
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
