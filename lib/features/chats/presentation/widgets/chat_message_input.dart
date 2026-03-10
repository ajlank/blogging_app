import 'package:flutter/material.dart';
import 'package:blog_app/core/utils/constants/chat_strings.dart';

class ChatMessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatMessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: ChatStrings.writeYourMessage,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: onSend,
            icon: const Icon(Icons.send, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
