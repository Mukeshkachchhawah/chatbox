import 'package:chat_appilication/ui_helper.dart';
import 'package:chat_appilication/until/list_images.dart';
import 'package:flutter/material.dart';

class ChatScreens extends StatefulWidget {
  const ChatScreens({
    super.key,
  });

  @override
  State<ChatScreens> createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  var messageController = TextEditingController();
  final List<Message> _message = [];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: AssetImage(""),
              ),
              wSpace(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("User name"),
                  Text(
                    "Online",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call))
          ],
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.landscape
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Flexible(
                            child: ListView.builder(
                          reverse: true,
                          itemCount: _message.length,
                          itemBuilder: (context, index) {
                            return BuildMessage(_message[index]);
                          },
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomTextFild(
                                messageController,
                                "Type a message.....",
                                "input",
                                IconButton(
                                    onPressed: SendMessage,
                                    icon: Icon(Icons.send))),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.camera)),
                            IconButton(onPressed: () {}, icon: Icon(Icons.mic))
                          ],
                        )
                      ],
                    ),
                  )
                :
                //// orientation.portaed
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Flexible(
                            child: ListView.builder(
                          reverse: true,
                          itemCount: _message.length,
                          itemBuilder: (context, index) {
                            return BuildMessage(_message[index]);
                          },
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomTextFild(
                                messageController,
                                "Type a message.....",
                                "input",
                                IconButton(
                                    onPressed: SendMessage,
                                    icon: Icon(Icons.send))),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.camera_alt)),
                            IconButton(onPressed: () {}, icon: Icon(Icons.mic))
                          ],
                        )
                      ],
                    ),
                  );
          },
        ));
  }

  Widget BuildMessage(Message message) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.isMe ? 'you' : 'ChatBot',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              message.text,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  void SendMessage() {
    Message message = Message(text: messageController.text, isMe: true);
    messageController.clear();
    setState(() {
      _message.insert(0, message);
    });

    //// call by sendChatGPTApi
  }
}

class Message {
  final String text;
  final bool isMe;
  Message({required this.text, required this.isMe});
}
