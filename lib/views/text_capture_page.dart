import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TextCapturePage extends StatelessWidget {
  final String apiUrl = 'http://your-flask-server-ip/api/capture'; // Replace with your API URL

  Future<void> captureText() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print('Captured text: ${response.body}');
        // Implement further logic as needed with the captured text
      } else {
        throw Exception('Failed to capture text: ${response.statusCode}');
      }
    } catch (e) {
      print('Error capturing text: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Capture Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            captureText();
          },
          child: Text('Capture Text'),
        ),
      ),
    );
  }
}
