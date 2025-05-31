import 'package:chat_appilication/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatViewModel(),
      child: Consumer<ChatViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(title: const Text("AI Chat")),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: viewModel.messages.length,
                    itemBuilder: (context, index) {
                      final msg = viewModel.messages[index];
                      final isUser = msg['sender'] == 'user';

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: isUser
                                ? Colors.blueAccent
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Text(
                            msg['message'].toString(),
                            style: TextStyle(
                              color: isUser ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: "Type your message...",
                            border: OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (value) async {
                            final text = value.trim();
                            if (text.isNotEmpty) {
                              await viewModel.sendMessageToAI(text);
                              _controller.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
