import 'package:blog_app/features/chats/domain/usecases/chats_use_cases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsNotifier {
  final ChatsUseCases _chatsUseCases;

  const ChatsNotifier(this._chatsUseCases);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchLegacyChatMessages() {
    return _chatsUseCases.watchLegacyChatMessages();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchGlobalChatMessages() {
    return _chatsUseCases.watchGlobalChatMessages();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchChatMessages(
    String chatRoomId,
  ) {
    return _chatsUseCases.watchChatMessages(chatRoomId);
  }

  Future<void> sendGlobalMessage({
    required String senderId,
    required String senderName,
    required String imageUrl,
    required String message,
  }) {
    return _chatsUseCases.sendGlobalMessage(
      senderId: senderId,
      senderName: senderName,
      imageUrl: imageUrl,
      message: message,
    );
  }

  Future<void> sendLegacyChatMessage({
    required String text,
    required String sender,
  }) {
    return _chatsUseCases.sendLegacyChatMessage(text: text, sender: sender);
  }

  Future<void> sendMessage({
    required String chatRoomId,
    required String senderId,
    required String senderName,
    required String imageUrl,
    required String recieverId,
    required String message,
  }) {
    return _chatsUseCases.sendMessage(
      chatRoomId: chatRoomId,
      senderId: senderId,
      senderName: senderName,
      imageUrl: imageUrl,
      recieverId: recieverId,
      message: message,
    );
  }
}
