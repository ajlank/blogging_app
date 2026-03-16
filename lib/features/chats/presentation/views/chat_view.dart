import 'package:blog_app/features/home/presentation/controllers/home_user_profile_notifier.dart';
import 'package:blog_app/features/chats/presentation/controllers/chats_notifier.dart';
import 'package:blog_app/features/chats/presentation/widgets/chat_app_bar_title.dart';
import 'package:blog_app/features/chats/presentation/widgets/chat_message_input.dart';
import 'package:blog_app/features/chats/presentation/widgets/chat_messages_list.dart';
import 'package:blog_app/core/utils/constants/chat_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  ChatView({
    super.key,
    required this.chatRoomId,
    required this.senderName,
    required this.imgUrl,
    required this.recieverId,
  });

  final String chatRoomId;
  final String senderName;
  final String imgUrl;
  final String recieverId;
  final TextEditingController _message = TextEditingController();

  Future<void> onSendMessage(BuildContext context) async {
    if (_message.text.isNotEmpty) {
      await context.read<ChatsNotifier>().sendMessage(
        chatRoomId: chatRoomId,
        senderId: FirebaseAuth.instance.currentUser!.uid,
        senderName: senderName,
        imageUrl: imgUrl,
        recieverId: recieverId,
        message: _message.text,
      );
      _message.clear();
    } 
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final stream = context.read<ChatsNotifier>().watchChatMessages(chatRoomId);

    return Scaffold(
      appBar: AppBar(
        title: ChatAppBarTitle(
          userName: context.watch<HomeUserProfileNotifier>().homeUserName,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: ChatMessagesList(
              stream: stream,
              currentUserId: currentUserId,
            ),
          ),
          ChatMessageInput(
            controller: _message,
            onSend: () async {
              await onSendMessage(context);
            },
          ),
        ],
      ),
    );
  }
}
