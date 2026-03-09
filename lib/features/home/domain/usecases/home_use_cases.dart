import 'package:blog_app/features/home/domain/repositories/home_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeUseCases {
  final HomeRepository _homeRepository;

  const HomeUseCases(this._homeRepository);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchProfileSettings(
    String userId,
  ) {
    return _homeRepository.watchProfileSettings(userId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
  watchPostReactionCommentNotifications(String userId) {
    return _homeRepository.watchPostReactionCommentNotifications(userId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchGlobalChatroom() {
    return _homeRepository.watchGlobalChatroom();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchPosts() {
    return _homeRepository.watchPosts();
  }

  Future<void> deletePost(String documentId) {
    return _homeRepository.deletePost(documentId);
  }

  Future<void> likePost({
    required String documentId,
    required String userId,
  }) {
    return _homeRepository.likePost(documentId: documentId, userId: userId);
  }

  Future<void> unlikePost({
    required String documentId,
    required String userId,
  }) {
    return _homeRepository.unlikePost(documentId: documentId, userId: userId);
  }

  Future<void> addPostReactionCommentNotification({
    required String senderId,
    required String receiverId,
    required String senderImg,
    required String senderName,
  }) {
    return _homeRepository.addPostReactionCommentNotification(
      senderId: senderId,
      receiverId: receiverId,
      senderImg: senderImg,
      senderName: senderName,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchComments(String postId) {
    return _homeRepository.watchComments(postId);
  }

  Future<void> updateTotalComment({
    required String postId,
    required int totalComment,
  }) {
    return _homeRepository.updateTotalComment(
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
    return _homeRepository.addComment(
      postId: postId,
      userId: userId,
      userName: userName,
      userImage: userImage,
      commentText: commentText,
    );
  }

  Future<void> signOut() {
    return _homeRepository.signOut();
  }
}
