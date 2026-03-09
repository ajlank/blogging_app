import 'package:blog_app/features/home/domain/repositories/home_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHomeRepository implements HomeRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FirebaseHomeRepository({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  }) : _firestore = firestore ?? FirebaseFirestore.instance,
       _auth = auth ?? FirebaseAuth.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchProfileSettings(
    String userId,
  ) {
    return _firestore
        .collection('profilesettings')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>>
  watchPostReactionCommentNotifications(String userId) {
    return _firestore
        .collection('postReactionCommentNotification')
        .where('notifRecieverId', isEqualTo: userId)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchGlobalChatroom() {
    return _firestore.collection('globalChatroom').snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchPosts() {
    return _firestore
        .collection('posts')
        .orderBy('postedAt', descending: true)
        .snapshots();
  }

  @override
  Future<void> deletePost(String documentId) {
    return _firestore.collection('posts').doc(documentId).delete();
  }

  @override
  Future<void> likePost({
    required String documentId,
    required String userId,
  }) {
    return _firestore.collection('posts').doc(documentId).update({
      'likedBy': FieldValue.arrayUnion([userId]),
      'isLiked': FieldValue.arrayUnion([userId]),
      'likeCount': FieldValue.increment(1),
    });
  }

  @override
  Future<void> unlikePost({
    required String documentId,
    required String userId,
  }) {
    return _firestore.collection('posts').doc(documentId).update({
      'likeCount': FieldValue.increment(-1),
      'isLiked': FieldValue.arrayRemove([userId]),
    });
  }

  @override
  Future<void> addPostReactionCommentNotification({
    required String senderId,
    required String receiverId,
    required String senderImg,
    required String senderName,
  }) {
    return _firestore.collection('postReactionCommentNotification').add({
      'notifSenderId': senderId,
      'notifRecieverId': receiverId,
      'notifSenderImg': senderImg,
      'notifSenderName': senderName,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchComments(String postId) {
    return _firestore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  @override
  Future<void> updateTotalComment({
    required String postId,
    required int totalComment,
  }) {
    return _firestore.collection('posts').doc(postId).update({
      'totalComment': totalComment,
    });
  }

  @override
  Future<void> addComment({
    required String postId,
    required String userId,
    required String userName,
    required String userImage,
    required String commentText,
  }) {
    return _firestore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .add({
          'userId': userId,
          'userName': userName,
          'userImage': userImage,
          'commentText': commentText,
          'timestamp': FieldValue.serverTimestamp(),
        });
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
}
