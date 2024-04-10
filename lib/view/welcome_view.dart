import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Icon(
                Icons.accessibility_new_rounded,
                size: 100,
                color: Colors.black,
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'Welcome To Optiway',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Sign In Button
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(onTap: () {  },)),
                  );
                },
                child: Text('Sign In', style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black, fixedSize: Size(200, 50)),
              ),
            ),
            // Register Button
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage(onTap: () {  },)),
                  );
                },
                child: Text('Create Account', style: TextStyle(color: Colors.black),),style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 221, 221, 221), fixedSize: Size(200, 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}