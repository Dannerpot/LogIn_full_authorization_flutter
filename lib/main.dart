import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modern_login/views/home_page.dart';
import 'package:provider/provider.dart';
import 'package:modern_login/views/auth_view.dart';
import 'package:modern_login/views/home_page.dart';
import 'package:modern_login/viewmodels/auth_view_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: MaterialApp(
        title: 'Optiway',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Handle loading state
        } else if (snapshot.hasData) {
          return HomePage(); // Navigate to HomeView if logged in
        } else {
          return AuthView(); // Show AuthView if not logged in
        }
      },
    );
  }
}
