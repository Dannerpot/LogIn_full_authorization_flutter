// text_capture_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modern_login/viewmodels/text_capture_view_model.dart'; // Adjust this import based on your project structure

class TextCapturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TextCaptureViewModel(),
      child: _TextCapturePage(),
    );
  }
}

class _TextCapturePage extends StatefulWidget {
  @override
  __TextCapturePageState createState() => __TextCapturePageState();
}

class __TextCapturePageState extends State<_TextCapturePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TextCaptureViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Text Capture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (viewModel.detectedText.isNotEmpty)
              Text('Detected Text: ${viewModel.detectedText}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.captureText,
              child: Text('Capture Text'),
            ),
          ],
        ),
      ),
    );
  }
}
