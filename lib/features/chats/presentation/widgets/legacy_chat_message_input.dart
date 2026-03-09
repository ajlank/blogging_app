import 'package:flutter/material.dart';

class LegacyChatMessageInput extends StatelessWidget {
  const LegacyChatMessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  final TextEditingController controller;
  final Future<void> Function() onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.grey.shade700,
              ),
              child: TextField(
                controller: controller,
                cursorColor: Colors.teal,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await onSend();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(45, 45),
              backgroundColor: Colors.teal,
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.send, size: 25),
          ),
        ],
      ),
    );
  }
}
