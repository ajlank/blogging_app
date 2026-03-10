import 'dart:math';
import 'package:blog_app/base/styles/chat_theme.dart';
import 'package:blog_app/features/chats/presentation/controllers/chats_notifier.dart';
import 'package:blog_app/features/chats/presentation/widgets/legacy_chat_app_bar.dart';
import 'package:blog_app/features/chats/presentation/widgets/legacy_chat_message_input.dart';
import 'package:blog_app/features/chats/presentation/widgets/legacy_chat_messages_stream.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

int user = Random().nextInt(3000);

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();

  Future<void> _sendMessage() async {
    if (_textController.text.trim() != '') {
      await context.read<ChatsNotifier>().sendLegacyChatMessage(
        text: _textController.text,
        sender: '$user',
      );
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final stream = context.read<ChatsNotifier>().watchLegacyChatMessages();
    final chatTheme = Theme.of(context).extension<ChatTheme>()!;

    return Scaffold(
      appBar: const LegacyChatAppBar(),
      backgroundColor: chatTheme.legacyChatBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LegacyChatMessagesStream(
            stream: stream,
            currentUser: user.toString(),
          ),
          LegacyChatMessageInput(controller: _textController, onSend: _sendMessage),
        ],
      ),
    );
  }
}
