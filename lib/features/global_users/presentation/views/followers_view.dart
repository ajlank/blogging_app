import 'package:blog_app/features/global_users/presentation/controllers/global_users_notifier.dart';
import 'package:blog_app/features/global_users/presentation/widgets/followers_app_bar.dart';
import 'package:blog_app/features/global_users/presentation/widgets/followers_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowersView extends StatelessWidget {
  const FollowersView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return const Scaffold(
        body: Center(child: Text('Please login again')),
      );
    }

    final stream = context.read<GlobalUsersNotifier>().watchFollowersByReceiver(
      currentUser.uid,
    );

    return Scaffold(
      appBar: const FollowersAppBar(),
      body: FollowersList(stream: stream),
    );
  }
}
