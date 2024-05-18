import 'package:flutter/material.dart';
import 'package:optiway/views/text_capture_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextCapturePage()),
            );
          },
          child: Text('Capture Text'),
        ),
      ),
    );
  }
}
