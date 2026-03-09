import 'package:blog_app/features/global_users/domain/usecases/global_users_use_cases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GlobalUsersNotifier {
  final GlobalUsersUseCases _globalUsersUseCases;

  const GlobalUsersNotifier(this._globalUsersUseCases);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchAllChatsByReceiver(
    String receiverId,
  ) {
    return _globalUsersUseCases.watchAllChatsByReceiver(receiverId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchFollowersByReceiver(
    String receiverId,
  ) {
    return _globalUsersUseCases.watchFollowersByReceiver(receiverId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchUserChatsBySender(
    String senderId,
  ) {
    return _globalUsersUseCases.watchUserChatsBySender(senderId);
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
    return _globalUsersUseCases.sendUserChatMessage(
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
