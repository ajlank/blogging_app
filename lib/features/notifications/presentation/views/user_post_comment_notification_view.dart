import 'package:blog_app/controller/notification_notifier.dart';
import 'package:blog_app/features/notifications/presentation/controllers/notifications_notifier.dart';
import 'package:blog_app/features/notifications/presentation/widgets/user_post_comment_notification_app_bar.dart';
import 'package:blog_app/features/notifications/presentation/widgets/user_post_comment_notification_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPostCommentNotification extends StatefulWidget {
  const UserPostCommentNotification({super.key});

  @override
  State<UserPostCommentNotification> createState() =>
      _UserPostCommentNotificationState();
}

class _UserPostCommentNotificationState
    extends State<UserPostCommentNotification> {
  @override
  void initState() {
    context.read<NotificationNotifier>().setAnyNotification(false);
    super.initState();
  }

  @override
  void dispose() {
    context.read<NotificationNotifier>().setAnyNotification(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserPostCommentNotificationAppBar(),
      body: UserPostCommentNotificationList(
        stream: context
            .read<NotificationsNotifier>()
            .watchPostReactionCommentNotifications(),
        currentUserId: FirebaseAuth.instance.currentUser!.uid,
      ),
    );
  }
}
