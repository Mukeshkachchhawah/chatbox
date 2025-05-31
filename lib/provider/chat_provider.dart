/* import 'package:chat_appilication/service/api.dart';
import 'package:flutter/material.dart';
class ChatViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  String _response = '';
  String get response => _response;

  Future<void> sendMessageToAI(String message) async {
    try {
      _response = await _apiService.sendMessage(message);
      notifyListeners();
    } catch (e) {
      _response = 'Error: ${e.toString()}';
      notifyListeners();
    }
  }
}
 */


import 'package:chat_appilication/service/api.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  final List<Map<String, String>> _messages = [];
  List<Map<String, String>> get messages => _messages;

  Future<void> sendMessageToAI(String userMessage) async {
    // Add user message
    _messages.add({
      'sender': 'user',
      'message': userMessage,
    });

    notifyListeners();

    try {
      final aiResponse = await _apiService.sendMessage(userMessage);

      // Add AI response
      _messages.add({
        'sender': 'ai',
        'message': aiResponse,
      });

      notifyListeners();
    } catch (e) {
      _messages.add({
        'sender': 'ai',
        'message': 'Error: ${e.toString()}',
      });

      notifyListeners();
    }
  }
}
