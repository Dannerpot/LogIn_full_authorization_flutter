import 'package:flutter/material.dart';
import 'package:modern_login/viewmodels/register_view_model.dart';
import 'package:modern_login/widgets/my_button.dart';
import 'package:modern_login/widgets/my_textfield.dart';

class RegisterView extends StatelessWidget {
  final RegisterViewModel viewModel;

  const RegisterView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              hintText: 'Email',
              onChanged: (value) {},controller: TextEditingController(), // Implement your logic
            ),
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              onChanged: (value) {},controller: TextEditingController(), // Implement your logic
            ),
            MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              onChanged: (value) {},controller: TextEditingController(), // Implement your logic
            ),
            MyButton(
              text: 'Create Account',
              onPressed: () {}, // Implement your logic
            ),
            TextButton(
              onPressed: () {
                viewModel.togglePages();
              },
              child: const Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
