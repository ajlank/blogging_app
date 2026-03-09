import 'package:cloud_firestore/cloud_firestore.dart';

abstract class NotificationsRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> watchFollowingNotifications();

  Stream<QuerySnapshot<Map<String, dynamic>>>
  watchPostReactionCommentNotifications();
}
