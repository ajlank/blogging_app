import 'package:blog_app/features/notifications/domain/usecases/notifications_use_cases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsNotifier {
  final NotificationsUseCases _notificationsUseCases;

  const NotificationsNotifier(this._notificationsUseCases);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchFollowingNotifications() {
    return _notificationsUseCases.watchFollowingNotifications();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
  watchPostReactionCommentNotifications() {
    return _notificationsUseCases.watchPostReactionCommentNotifications();
  }
}
