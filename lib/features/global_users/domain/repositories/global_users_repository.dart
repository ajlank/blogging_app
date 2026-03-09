import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GlobalUsersRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> watchAllChatsByReceiver(
    String receiverId,
  );

  Stream<QuerySnapshot<Map<String, dynamic>>> watchFollowersByReceiver(
    String receiverId,
  );

  Stream<QuerySnapshot<Map<String, dynamic>>> watchUserChatsBySender(
    String senderId,
  );

  Future<void> sendUserChatMessage({
    required String senderId,
    required String senderName,
    required String senderImg,
    required String senderMessage,
    required String recieverId,
    required String recieverName,
    required String recieverMessage,
  });
}
