import 'package:blog_app/features/global_users/presentation/widgets/chat_with_sender_message_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatWithSenderMessagesList extends StatelessWidget {
  final Stream<QuerySnapshot<Map<String, dynamic>>> stream;

  const ChatWithSenderMessagesList({
    super.key,
    required this.stream,
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
          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();
              return Column(
                children: [
                  ChatWithSenderMessageTile(
                    senderMessage: data['senderMessage'],
                    recieverMessage: data['recieverMessage'],
                  ),
                ],
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
