import 'package:blog_app/features/home/presentation/controllers/home_user_profile_notifier.dart';
import 'package:blog_app/features/notifications/presentation/controllers/notification_notifier.dart';
import 'package:blog_app/features/global_users/presentation/controllers/global_users_notifier.dart';
import 'package:blog_app/features/global_users/presentation/widgets/chat_with_sender_app_bar_title.dart';
import 'package:blog_app/features/global_users/presentation/widgets/chat_with_sender_input_field.dart';
import 'package:blog_app/features/global_users/presentation/widgets/chat_with_sender_messages_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatWithSenderView extends StatefulWidget {
  const ChatWithSenderView({super.key});

  @override
  State<ChatWithSenderView> createState() => _ChatWithSenderViewState();
}

class _ChatWithSenderViewState extends State<ChatWithSenderView> {
  late final TextEditingController _messageController;
  late final TextEditingController _recieverMessageController;

  @override
  void initState() {
    _messageController = TextEditingController();
    _recieverMessageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _recieverMessageController.dispose();
    super.dispose();
  }

  Future<void> sendMessageHandler() async {
    try {
      await context.read<GlobalUsersNotifier>().sendUserChatMessage(
        senderId: FirebaseAuth.instance.currentUser!.uid,
        senderName: context.read<NotificationNotifier>().notifSenderName,
        senderImg: context.read<NotificationNotifier>().notifSenderImage,
        senderMessage: _messageController.text,
        recieverId: context.read<HomeUserProfileNotifier>().homeUserId,
        recieverName: context.read<HomeUserProfileNotifier>().homeUserName,
        recieverMessage: _recieverMessageController.text,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final stream = context.read<GlobalUsersNotifier>().watchUserChatsBySender(
      context.watch<HomeUserProfileNotifier>().allMessageSpecificUserId,
    );

    final isCurrentUserReceiver =
        FirebaseAuth.instance.currentUser!.uid ==
        context.watch<HomeUserProfileNotifier>().homeUserId;

    return Scaffold(
      appBar: AppBar(
        title: ChatWithSenderAppBarTitle(
          senderName: context.watch<HomeUserProfileNotifier>().senderName,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: ChatWithSenderMessagesList(stream: stream),
          ),
          ChatWithSenderInputField(
            controller:
                isCurrentUserReceiver
                    ? _recieverMessageController
                    : _messageController,
            hintText:
                isCurrentUserReceiver
                    ? 'Write your message as receiver'
                    : 'Write your message as sender',
            onSend: () async {
              await sendMessageHandler();
              FocusScope.of(context).unfocus();
              _recieverMessageController.clear();
              _messageController.clear();
            },
          ),
        ],
      ),
    );
  }
}
