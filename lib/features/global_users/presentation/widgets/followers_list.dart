import 'package:blog_app/features/global_users/presentation/widgets/follower_list_tile.dart';
import 'package:blog_app/core/utils/constants/chat_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FollowersList extends StatelessWidget {
  final Stream<QuerySnapshot<Map<String, dynamic>>> stream;

  const FollowersList({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text(ChatStrings.noFollowersYet));
        }
        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();
              return FollowerListTile(
                senderImage: data['notifSenderImg'] ?? '',
                senderName: data['notifSenderName'],
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
