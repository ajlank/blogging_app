import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FollowersView extends StatelessWidget {
  const FollowersView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return const Scaffold(
        body: Center(child: Text('Please login again')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('All followers'), centerTitle: true),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("followingNotifications")
            .where('notifRecieverId', isEqualTo: currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No followers yet'));
          }
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final data = docs[index].data();

                return ListTile(
                  contentPadding: EdgeInsets.all(12),
                  onTap: () {
                    // context
                    //     .read<HomeUserProfileNotifier>()
                    //     .setAllMessageSpecificUserId(data['senderId']);
                    // context.read<HomeUserProfileNotifier>().setSenderName(
                    //   data['senderName'],
                    // );
                    // Navigator.of(context).pushNamed(chatWithSenderRoute);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data['notifSenderImg'] ?? ''),
                  ),
                  title: Text(data['notifSenderName']),
                  splashColor: const Color.fromARGB(255, 226, 221, 202),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
