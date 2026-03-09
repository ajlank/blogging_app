import 'package:blog_app/features/global_users/domain/repositories/global_users_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseGlobalUsersRepository implements GlobalUsersRepository {
  final FirebaseFirestore _firestore;

  FirebaseGlobalUsersRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchAllChatsByReceiver(
    String receiverId,
  ) {
    return _firestore
        .collection('allChats')
        .where('recieverId', isEqualTo: receiverId)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchFollowersByReceiver(
    String receiverId,
  ) {
    return _firestore
        .collection("followingNotifications")
        .where('notifRecieverId', isEqualTo: receiverId)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchUserChatsBySender(
    String senderId,
  ) {
    return _firestore
        .collection('UserChatting')
        .where('senderId', isEqualTo: senderId)
        .snapshots();
  }

  @override
  Future<void> sendUserChatMessage({
    required String senderId,
    required String senderName,
    required String senderImg,
    required String senderMessage,
    required String recieverId,
    required String recieverName,
    required String recieverMessage,
  }) {
    return _firestore.collection('UserChatting').add({
      'senderId': senderId,
      'senderName': senderName,
      'senderImg': senderImg,
      'senderMessage': senderMessage,
      'recieverId': recieverId,
      'recieverName': recieverName,
      'recieverMessage': recieverMessage,
      'IdsAsArray': FieldValue.arrayUnion([senderId, recieverId]),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
