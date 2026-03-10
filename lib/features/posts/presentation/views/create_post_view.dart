import 'dart:io';
import 'package:blog_app/controller/profile_settings_notifier.dart';
import 'package:blog_app/features/posts/presentation/controllers/posts_notifier.dart';
import 'package:blog_app/features/posts/presentation/widgets/create_post_button.dart';
import 'package:blog_app/features/posts/presentation/widgets/create_post_image_picker.dart';
import 'package:blog_app/features/posts/presentation/widgets/create_post_text_field.dart';
import 'package:blog_app/core/utils/constants/app_routes.dart';
import 'package:blog_app/core/utils/constants/post_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  late final TextEditingController _titleController;
  late final TextEditingController _postController;
  late final TextEditingController _commentController;
  String nm = '';
  String img = '';

  File? postImageFile;

  @override
  void initState() {
    _titleController = TextEditingController();
    _postController = TextEditingController();
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _postController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> userPost() async {
    try {
      final profile = Provider.of<ProfileSettingsNotifier>(
        context,
        listen: false,
      );
      final userName = profile.userName;
      final userImageUrl = profile.profileImageUrl;

      if (userName.isEmpty || userImageUrl.isEmpty) {
        print(PostStrings.userDataNotLoaded);
        return;
      }

      await context.read<PostsNotifier>().createPost(
        userId: FirebaseAuth.instance.currentUser!.uid,
        userName: userName,
        userImageUrl: userImageUrl,
        postText: _postController.text,
        postImageFile: postImageFile,
      );

      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pushNamedAndRemoveUntil(homeRoute, (_) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CreatePostImagePicker(
            postImageFile: postImageFile,
            onTap: () async {
              final image = await selectImage();
              setState(() {
                postImageFile = image;
              });
            },
          ),
          CreatePostTextField(controller: _postController),
          CreatePostButton(
            onPressed: () async {
              await userPost();
            },
          ),
        ],
      ),
    );
  }
}

Future<File?> selectImage() async {
  final imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
  if (file != null) {
    return File(file.path);
  }
  return null;
}
