import 'dart:io';
import 'package:blog_app/controller/home_post_notifier.dart';
import 'package:blog_app/features/posts/presentation/controllers/posts_notifier.dart';
import 'package:blog_app/features/posts/presentation/widgets/create_post_image_picker.dart';
import 'package:blog_app/features/posts/presentation/widgets/create_post_text_field.dart';
import 'package:blog_app/features/posts/presentation/widgets/update_post_button.dart';
import 'package:blog_app/core/utils/constants/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UpdatePost extends StatefulWidget {
  const UpdatePost({super.key});

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  late final TextEditingController _titleController;
  late final TextEditingController _postController;
  late final TextEditingController _commentController;
  String nm = '';
  String img = '';

  File? postImageFile;

  @override
  void initState() {
    _titleController = TextEditingController();
    _postController =
        Provider.of<HomePostNotifier>(context, listen: false).postText.isNotEmpty
            ? TextEditingController(
                text: Provider.of<HomePostNotifier>(
                  context,
                  listen: false,
                ).postText,
              )
            : TextEditingController();
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

  Future<void> updateUserPost(String docId) async {
    try {
      final profile = Provider.of<HomePostNotifier>(context, listen: false);
      final userName = profile.userName;
      final userImageUrl = profile.userImgUrl;

      if (userName.isEmpty || userImageUrl.isEmpty) {
        print("User data not loaded.");
        return;
      }

      await context.read<PostsNotifier>().updatePost(
        docId: docId,
        userId: FirebaseAuth.instance.currentUser!.uid,
        userName: userName,
        userImageUrl: userImageUrl,
        postText: _postController.text,
        existingPostImageUrl: context.read<HomePostNotifier>().postImg,
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
    print(GetStorage().read('me+${FirebaseAuth.instance.currentUser!.uid}'));
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
          UpdatePostButton(
            onPressed: () async {
              await updateUserPost(
                Provider.of<HomePostNotifier>(context, listen: false).docId,
              );
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
