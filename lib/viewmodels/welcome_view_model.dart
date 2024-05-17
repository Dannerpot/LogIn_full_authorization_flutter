// welcome_view_model.dart
import 'package:flutter/material.dart';

import '../services/register_page.dart';

class WelcomeViewModel extends ChangeNotifier {
  // Add any methods or logic needed for the Welcome screen here

  void signIn(BuildContext context) {
    // Logic for signing in
    // Navigate to sign in screen
    Navigator.pushNamed(context, '/signin');
  }

  void createAccount(BuildContext context) {
    // Logic for creating an account
    // Navigate to create account screen
    Navigator.pushNamed(context, RegisterPage(onTap: () {  },) as String);
  }
}