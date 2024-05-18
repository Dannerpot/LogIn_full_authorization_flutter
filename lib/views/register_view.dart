import 'package:flutter/material.dart';
import 'package:optiway/components/my_button.dart';
import 'package:optiway/components/my_textfield.dart';
import 'package:optiway/viewmodels/register_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterView extends StatelessWidget {
  final RegisterViewModel viewModel;

  const RegisterView({Key? key, required this.viewModel}) : super(key: key);

  void _registerWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create a Firestore document for the user
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        // Add more fields as needed
      });

      // Optionally, you can navigate to another screen after successful registration
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));

    } catch (e) {
      print('Failed to register: $e');
      // Handle error, show alert, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              hintText: 'Email',
              controller: emailController,
              obscureText: false,
            ),
            MyTextField(
              hintText: 'Password',
              controller: passwordController,
              obscureText: true,
            ),
            MyTextField(
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              obscureText: true,
            ),
            MyButton(
              text: 'Register',
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                String confirmPassword = confirmPasswordController.text.trim();

                if (password == confirmPassword) {
                  _registerWithEmailAndPassword(context, email, password);
                } else {
                  // Handle password mismatch
                  print('Passwords do not match');
                }
              },
            ),
            TextButton(
              onPressed: () {
                viewModel.togglePages(); // Navigate to Sign In view
              },
              child: const Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
