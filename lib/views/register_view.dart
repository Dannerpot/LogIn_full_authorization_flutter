import 'package:flutter/material.dart';
import 'package:optiway/components/my_button.dart';
import 'package:optiway/components/my_textfield.dart';
import 'package:optiway/viewmodels/register_view_model.dart';

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
              onChanged: (value) {},controller: TextEditingController(), obscureText: false, // Implement your logic
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
