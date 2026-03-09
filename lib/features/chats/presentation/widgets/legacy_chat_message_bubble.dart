import 'dart:math';
import 'package:flutter/material.dart';

class LegacyChatMessageBubble extends StatelessWidget {
  const LegacyChatMessageBubble({
    super.key,
    required this.sender,
    required this.text,
    required this.isMe,
  });

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            color: isMe ? Colors.teal : Colors.grey.shade700,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sender,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    text,
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
