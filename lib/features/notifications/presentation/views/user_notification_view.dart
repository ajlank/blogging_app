import 'package:blog_app/controller/notification_notifier.dart';
import 'package:blog_app/features/notifications/presentation/controllers/notifications_notifier.dart';
import 'package:blog_app/features/notifications/presentation/widgets/user_notification_app_bar.dart';
import 'package:blog_app/features/notifications/presentation/widgets/user_notification_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({super.key});

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
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
      appBar: const UserNotificationAppBar(),
      body: UserNotificationList(
        stream: context.read<NotificationsNotifier>().watchFollowingNotifications(),
        currentUserId: FirebaseAuth.instance.currentUser!.uid,
      ),
    );
  }
}
