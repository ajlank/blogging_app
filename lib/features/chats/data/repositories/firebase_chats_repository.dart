import 'package:blog_app/features/chats/domain/repositories/chats_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChatsRepository implements ChatsRepository {
  final FirebaseFirestore _firestore;

  FirebaseChatsRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchLegacyChatMessages() {
    return _firestore
        .collection('messages')
        .orderBy('dt', descending: true)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchGlobalChatMessages() {
    return _firestore
        .collection('globalChatroom')
        .orderBy('time', descending: false)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchChatMessages(
    String chatRoomId,
  ) {
    return _firestore
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .orderBy('time', descending: false)
        .snapshots();
  }

  @override
  Future<void> sendGlobalMessage({
    required String senderId,
    required String senderName,
    required String imageUrl,
    required String message,
  }) {
    final messages = {
      "senderId": senderId,
      "senderName": senderName,
      "img": imageUrl,
      "message": message,
      "time": FieldValue.serverTimestamp(),
    };

    return _firestore.collection('globalChatroom').add(messages);
  }

  @override
  Future<void> sendLegacyChatMessage({
    required String text,
    required String sender,
  }) {
    return _firestore.collection('messages').add({
      'text': text,
      'sender': sender,
      'dt': DateTime.now(),
    });
  }

  @override
  Future<void> sendMessage({
    required String chatRoomId,
    required String senderId,
    required String senderName,
    required String imageUrl,
    required String recieverId,
    required String message,
  }) async {
    final messages = {
      "senderId": senderId,
      "senderName": senderName,
      "img": imageUrl,
      "message": message,
      "time": FieldValue.serverTimestamp(),
    };

    final allMessages = {
      "senderId": senderId,
      "senderName": senderName,
      "recieverId": recieverId,
      "img": imageUrl,
      "message": message,
      "roomId": chatRoomId,
      "time": FieldValue.serverTimestamp(),
    };

    await _firestore
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .add(messages);
    await _firestore.collection('allChats').add(allMessages);
  }
}
