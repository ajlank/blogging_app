import 'package:flutter/material.dart';

class FollowersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FollowersAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('All followers'), centerTitle: true);
  }
}
