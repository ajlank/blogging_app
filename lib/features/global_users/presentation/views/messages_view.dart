import 'package:blog_app/controller/home_user_profile_notifier.dart';
import 'package:blog_app/features/chats/presentation/views/chat_view.dart';
import 'package:blog_app/features/global_users/presentation/controllers/global_users_notifier.dart';
import 'package:blog_app/features/global_users/presentation/widgets/messages_app_bar.dart';
import 'package:blog_app/features/global_users/presentation/widgets/messages_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final stream = context.read<GlobalUsersNotifier>().watchAllChatsByReceiver(
      FirebaseAuth.instance.currentUser!.uid,
    );

    return Scaffold(
      appBar: const MessagesAppBar(),
      body: MessagesList(
        stream: stream,
        onItemTap: (data) {
          context.read<HomeUserProfileNotifier>().setHomeUserName(
            data['senderName'],
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChatView(
                chatRoomId: data['roomId'],
                senderName: data['senderName'],
                imgUrl: data['img'],
                recieverId: FirebaseAuth.instance.currentUser!.uid,
              ),
            ),
          );
        },
      ),
    );
  }
}
