// core/network/api_service.dart

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  final String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';
  final String _apiKey = 'AIzaSyA3HWhgG9PUb3Jn45V16yctwrkVXBpctQY';

  Future<String> sendMessage(String message) async {
    final url = '$_baseUrl?key=$_apiKey';

    final Map<String, dynamic> body = {
      "contents": [
        {
          "parts": [
            {
              "text": message,
            }
          ]
        }
      ]
    };

    try {
      final response = await _dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      final data = response.data;

      // Safely extract the AI response text
      final aiText = data['candidates']?[0]?['content']?['parts']?[0]?['text'] ?? 'No response';

      return aiText;
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }
}
