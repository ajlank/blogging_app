import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> watchProfileSettings(
    String userId,
  );

  Stream<QuerySnapshot<Map<String, dynamic>>>
  watchPostReactionCommentNotifications(String userId);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchGlobalChatroom();

  Stream<QuerySnapshot<Map<String, dynamic>>> watchPosts();

  Future<void> deletePost(String documentId);

  Future<void> likePost({required String documentId, required String userId});

  Future<void> unlikePost({required String documentId, required String userId});

  Future<void> addPostReactionCommentNotification({
    required String senderId,
    required String receiverId,
    required String senderImg,
    required String senderName,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> watchComments(String postId);

  Future<void> updateTotalComment({
    required String postId,
    required int totalComment,
  });

  Future<void> addComment({
    required String postId,
    required String userId,
    required String userName,
    required String userImage,
    required String commentText,
  });

  Future<void> signOut();
}
