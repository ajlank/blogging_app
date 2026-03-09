import 'package:blog_app/features/chats/presentation/widgets/legacy_chat_message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LegacyChatMessagesStream extends StatelessWidget {
  const LegacyChatMessagesStream({
    super.key,
    required this.stream,
    required this.currentUser,
  });

  final Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  final String currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.teal),
          );
        }
        final messages = snapshot.data!.docs;
        List<LegacyChatMessageBubble> messageBubbles = [];
        for (var message in messages) {
          final data = message.data();
          final messageText = data['text'];
          final messageSender = data['sender'];
          final messageBubble = LegacyChatMessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
