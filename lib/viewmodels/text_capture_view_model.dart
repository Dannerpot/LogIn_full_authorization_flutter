// text_capture_view_model.dart

import 'package:flutter/material.dart';
import 'package:modern_login/services/api_service.dart';

class TextCaptureViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();
  String _detectedText = '';

  String get detectedText => _detectedText;

  Future<void> captureText() async {
    try {
      String text = await apiService.captureText();
      _detectedText = text;
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error capturing text: $e');
    }
  }
}
