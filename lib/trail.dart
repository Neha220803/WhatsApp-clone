import 'package:flutter/material.dart';
import 'package:whats_app/message_model.dart';

class WhatsAppCloneScreen extends StatefulWidget {
  @override
  _WhatsAppCloneScreenState createState() => _WhatsAppCloneScreenState();
}

class _WhatsAppCloneScreenState extends State<WhatsAppCloneScreen> {
  final List<ChatMessage> messages = [
    ChatMessage(message: 'Hello', isSender: false),
    ChatMessage(message: 'Hi', isSender: true),
    ChatMessage(message: 'How are you?', isSender: false),
    ChatMessage(message: 'I\'m good. You?', isSender: true),
    // Add more messages as needed
  ];

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp Clone'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final ChatMessage message = messages[index];

                return Container(
                  color: message.isSender ? Colors.green : Colors.grey,
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      message.message,
                      style: TextStyle(
                        color: message.isSender ? Colors.white : Colors.black,
                        fontWeight: message.isSender
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final String message = messageController.text;
                    if (message.isNotEmpty) {
                      setState(() {
                        messages
                            .add(ChatMessage(message: message, isSender: true));
                        messageController.clear();
                      });
                    }
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
