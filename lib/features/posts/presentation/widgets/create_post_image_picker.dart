import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CreatePostImagePicker extends StatelessWidget {
  final File? postImageFile;
  final VoidCallback onTap;

  const CreatePostImagePicker({
    super.key,
    required this.postImageFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: postImageFile != null
              ? Image.file(postImageFile!)
              : const Center(
                  child: Icon(Icons.camera_alt_outlined, size: 40),
                ),
        ),
      ),
    );
  }
}
