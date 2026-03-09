import 'package:flutter/material.dart';

class GlobalChatAppBarTitle extends StatelessWidget {
  const GlobalChatAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Global chatroom', style: TextStyle(fontSize: 13)),
        SizedBox(width: 5),
      ],
    );
  }
}
