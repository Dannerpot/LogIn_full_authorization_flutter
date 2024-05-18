// text_capture_page.dart

import 'package:flutter/material.dart';
import 'package:optiway/viewmodels/text_capture_view_model.dart';
import 'package:provider/provider.dart';

class TextCapturePage extends StatelessWidget {
  const TextCapturePage({super.key});

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
        title: const Text('Text Capture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (viewModel.detectedText.isNotEmpty)
              Text('Detected Text: ${viewModel.detectedText}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.captureText,
              child: const Text('Capture Text'),
            ),
          ],
        ),
      ),
    );
  }
}
