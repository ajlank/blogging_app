import 'package:blog_app/features/notifications/presentation/widgets/user_post_comment_notification_tile.dart';
import 'package:blog_app/core/utils/constants/notification_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPostCommentNotificationList extends StatelessWidget {
  final Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  final String currentUserId;

  const UserPostCommentNotificationList({
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
        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return Center(child: Text(NotificationStrings.noNotifications));
        }
        if (snapshot.hasData) {
          final doc = snapshot.data!.docs;
          return ListView.builder(
            itemCount: doc.length,
            itemBuilder: (context, index) {
              final notif = doc[index].data();
              if (notif['notifRecieverId'] != currentUserId) {
                return SizedBox.shrink();
              }
              return UserPostCommentNotificationTile(
                senderImage: notif['notifSenderImg'],
                senderName: notif['notifSenderName'].toString(),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
