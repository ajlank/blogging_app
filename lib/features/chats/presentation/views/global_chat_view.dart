import 'package:blog_app/features/profile/presentation/controllers/profile_settings_notifier.dart';
import 'package:blog_app/features/chats/presentation/controllers/chats_notifier.dart';
import 'package:blog_app/features/chats/presentation/widgets/chat_message_input.dart';
import 'package:blog_app/features/chats/presentation/widgets/global_chat_app_bar_title.dart';
import 'package:blog_app/features/chats/presentation/widgets/global_chat_messages_list.dart';
import 'package:blog_app/core/utils/constants/chat_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalChatView extends StatelessWidget {
  final TextEditingController _message = TextEditingController();

  GlobalChatView({super.key});

  Future<void> onSendMessage(BuildContext context) async {
    if (_message.text.isNotEmpty) {
      await context.read<ChatsNotifier>().sendGlobalMessage(
        senderId: FirebaseAuth.instance.currentUser!.uid,
        senderName: Provider.of<ProfileSettingsNotifier>(
          context,
          listen: false,
        ).userName,
        imageUrl: Provider.of<ProfileSettingsNotifier>(
          context,
          listen: false,
        ).profileImageUrl,
        message: _message.text,
      );
      _message.clear();
    } 
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final stream = context.read<ChatsNotifier>().watchGlobalChatMessages();

    return Scaffold(
      appBar: AppBar(title: const GlobalChatAppBarTitle()),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: GlobalChatMessagesList(
              stream: stream,
              currentUserId: currentUserId,
            ),
          ),
          ChatMessageInput(
            controller: _message,
            onSend: () {
              onSendMessage(context);
            },
          ),
        ],
      ),
    );
  }
}
