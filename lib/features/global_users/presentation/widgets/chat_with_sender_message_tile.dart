import 'package:flutter/material.dart';

class ChatWithSenderMessageTile extends StatelessWidget {
  final String senderMessage;
  final String recieverMessage;

  const ChatWithSenderMessageTile({
    super.key,
    required this.senderMessage,
    required this.recieverMessage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        senderMessage,
        style: TextStyle(fontSize: 13.2),
      ),
      trailing: Text(
        recieverMessage,
        style: TextStyle(fontSize: 13.2),
      ),
    );
  }
}
