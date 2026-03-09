import 'package:blog_app/features/chats/presentation/widgets/global_chat_message_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GlobalChatMessagesList extends StatelessWidget {
  final Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  final String currentUserId;

  const GlobalChatMessagesList({
    super.key,
    required this.stream,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No data');
        }
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs;

          return ListView.builder(
            reverse: false,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final msg = messages[index];
              final isMe = msg['senderId'] == currentUserId;
              return GlobalChatMessageItem(
                isMe: isMe,
                senderName: msg['senderName'],
                imageUrl: msg['img'],
                message: msg['message'],
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
