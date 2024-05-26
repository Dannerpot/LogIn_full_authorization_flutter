import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.4.1/jpg'; // Replace with your actual API endpoint

  /// Fetches the captured text from the API.
  ///
  /// Throws an `ApiException` with a clear message in case of errors.
  Future<String> captureText() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/capture'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        return data['detected_text'] as String; // Type cast for clarity
      } else {
        throw ApiException('API request failed with status code: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      throw ApiException('Failed to connect to server: $e');
    } on FormatException catch (e) {
      throw ApiException('Invalid server response format: $e');
    } catch (e) {
      throw ApiException('An unknown error occurred: $e');
    }
  }
}

// Custom exception class for better error handling
class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() => message;
}
