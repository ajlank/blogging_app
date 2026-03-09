import 'package:blog_app/features/global_users/domain/repositories/global_users_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GlobalUsersUseCases {
  final GlobalUsersRepository _globalUsersRepository;

  const GlobalUsersUseCases(this._globalUsersRepository);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchAllChatsByReceiver(
    String receiverId,
  ) {
    return _globalUsersRepository.watchAllChatsByReceiver(receiverId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchFollowersByReceiver(
    String receiverId,
  ) {
    return _globalUsersRepository.watchFollowersByReceiver(receiverId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchUserChatsBySender(
    String senderId,
  ) {
    return _globalUsersRepository.watchUserChatsBySender(senderId);
  }

  Future<void> sendUserChatMessage({
    required String senderId,
    required String senderName,
    required String senderImg,
    required String senderMessage,
    required String recieverId,
    required String recieverName,
    required String recieverMessage,
  }) {
    return _globalUsersRepository.sendUserChatMessage(
      senderId: senderId,
      senderName: senderName,
      senderImg: senderImg,
      senderMessage: senderMessage,
      recieverId: recieverId,
      recieverName: recieverName,
      recieverMessage: recieverMessage,
    );
  }
}
