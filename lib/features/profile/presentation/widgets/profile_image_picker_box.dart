import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ProfileImagePickerBox extends StatelessWidget {
  final String title;
  final File? file;
  final VoidCallback onTap;

  const ProfileImagePickerBox({
    super.key,
    required this.title,
    required this.file,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        GestureDetector(
          onTap: onTap,
          child: DottedBorder(
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: file != null
                  ? Image.file(file!)
                  : const Center(
                      child: Icon(Icons.camera_alt_outlined, size: 40),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
