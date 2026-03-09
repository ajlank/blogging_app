import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatsRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> watchGlobalChatMessages();

  Stream<QuerySnapshot<Map<String, dynamic>>> watchChatMessages(
    String chatRoomId,
  );

  Future<void> sendGlobalMessage({
    required String senderId,
    required String senderName,
    required String imageUrl,
    required String message,
  });

  Future<void> sendMessage({
    required String chatRoomId,
    required String senderId,
    required String senderName,
    required String imageUrl,
    required String recieverId,
    required String message,
  });
}
