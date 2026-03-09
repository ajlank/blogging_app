import 'package:blog_app/features/home/domain/usecases/home_use_cases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeNotifier {
  final HomeUseCases _homeUseCases;

  const HomeNotifier(this._homeUseCases);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchProfileSettings(
    String userId,
  ) {
    return _homeUseCases.watchProfileSettings(userId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
  watchPostReactionCommentNotifications(String userId) {
    return _homeUseCases.watchPostReactionCommentNotifications(userId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchGlobalChatroom() {
    return _homeUseCases.watchGlobalChatroom();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchPosts() {
    return _homeUseCases.watchPosts();
  }

  Future<void> deletePost(String documentId) {
    return _homeUseCases.deletePost(documentId);
  }

  Future<void> likePost({
    required String documentId,
    required String userId,
  }) {
    return _homeUseCases.likePost(documentId: documentId, userId: userId);
  }

  Future<void> unlikePost({
    required String documentId,
    required String userId,
  }) {
    return _homeUseCases.unlikePost(documentId: documentId, userId: userId);
  }

  Future<void> addPostReactionCommentNotification({
    required String senderId,
    required String receiverId,
    required String senderImg,
    required String senderName,
  }) {
    return _homeUseCases.addPostReactionCommentNotification(
      senderId: senderId,
      receiverId: receiverId,
      senderImg: senderImg,
      senderName: senderName,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchComments(String postId) {
    return _homeUseCases.watchComments(postId);
  }

  Future<void> updateTotalComment({
    required String postId,
    required int totalComment,
  }) {
    return _homeUseCases.updateTotalComment(
      postId: postId,
      totalComment: totalComment,
    );
  }

  Future<void> addComment({
    required String postId,
    required String userId,
    required String userName,
    required String userImage,
    required String commentText,
  }) {
    return _homeUseCases.addComment(
      postId: postId,
      userId: userId,
      userName: userName,
      userImage: userImage,
      commentText: commentText,
    );
  }

  Future<void> signOut() {
    return _homeUseCases.signOut();
  }
}
