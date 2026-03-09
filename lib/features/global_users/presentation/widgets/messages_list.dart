import 'package:blog_app/features/global_users/presentation/widgets/messages_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  final Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  final void Function(Map<String, dynamic> data) onItemTap;

  const MessagesList({
    super.key,
    required this.stream,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();

              return MessagesListTile(
                onTap: () => onItemTap(data),
                senderName: data['senderName'] ?? '',
                imageUrl: data['img'] ?? '',
                message: data['message'] ?? '',
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
