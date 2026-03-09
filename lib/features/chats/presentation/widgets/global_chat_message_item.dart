import 'package:flutter/material.dart';

class GlobalChatMessageItem extends StatelessWidget {
  final bool isMe;
  final String senderName;
  final String imageUrl;
  final String message;

  const GlobalChatMessageItem({
    super.key,
    required this.isMe,
    required this.senderName,
    required this.imageUrl,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Row(
              children: [
                isMe
                    ? SizedBox.shrink()
                    : CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                SizedBox(width: 10),
                isMe
                    ? Text('')
                    : Text(
                        senderName,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
              ],
            ),
          ),
        ),
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Color(0xFFE4E6EB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
