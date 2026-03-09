import 'package:blog_app/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsUseCases {
  final NotificationsRepository _notificationsRepository;

  const NotificationsUseCases(this._notificationsRepository);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchFollowingNotifications() {
    return _notificationsRepository.watchFollowingNotifications();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
  watchPostReactionCommentNotifications() {
    return _notificationsRepository.watchPostReactionCommentNotifications();
  }
}
