import 'package:flutter/material.dart';

class ChatWithSenderAppBarTitle extends StatelessWidget {
  final String senderName;

  const ChatWithSenderAppBarTitle({
    super.key,
    required this.senderName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Chatting with', style: TextStyle(fontSize: 13)),
        SizedBox(width: 5),
        Text(
          senderName,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
