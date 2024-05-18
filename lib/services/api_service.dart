// api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.4.1/jpg'; // Replace with your Flask server URL

  Future<String> captureText() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/capture'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return data['detected_text'];
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to connect to server');
    }
  }
}
