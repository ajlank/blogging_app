import 'package:blog_app/features/chats/domain/repositories/chats_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsUseCases {
  final ChatsRepository _chatsRepository;

  const ChatsUseCases(this._chatsRepository);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchGlobalChatMessages() {
    return _chatsRepository.watchGlobalChatMessages();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchChatMessages(
    String chatRoomId,
  ) {
    return _chatsRepository.watchChatMessages(chatRoomId);
  }

  Future<void> sendGlobalMessage({
    required String senderId,
    required String senderName,
    required String imageUrl,
    required String message,
  }) {
    return _chatsRepository.sendGlobalMessage(
      senderId: senderId,
      senderName: senderName,
      imageUrl: imageUrl,
      message: message,
    );
  }

  Future<void> sendMessage({
    required String chatRoomId,
    required String senderId,
    required String senderName,
    required String imageUrl,
    required String recieverId,
    required String message,
  }) {
    return _chatsRepository.sendMessage(
      chatRoomId: chatRoomId,
      senderId: senderId,
      senderName: senderName,
      imageUrl: imageUrl,
      recieverId: recieverId,
      message: message,
    );
  }
}
