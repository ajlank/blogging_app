import 'package:blog_app/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseNotificationsRepository implements NotificationsRepository {
  final FirebaseFirestore _firestore;

  FirebaseNotificationsRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchFollowingNotifications() {
    return _firestore.collection('followingNotifications').snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>>
  watchPostReactionCommentNotifications() {
    return _firestore
        .collection('postReactionCommentNotification')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
