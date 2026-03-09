import 'dart:io';
import 'package:blog_app/features/posts/domain/usecases/posts_use_cases.dart';

class PostsNotifier {
  final PostsUseCases _postsUseCases;

  const PostsNotifier(this._postsUseCases);

  Future<void> createPost({
    required String userId,
    required String userName,
    required String userImageUrl,
    required String postText,
    File? postImageFile,
  }) {
    return _postsUseCases.createPost(
      userId: userId,
      userName: userName,
      userImageUrl: userImageUrl,
      postText: postText,
      postImageFile: postImageFile,
    );
  }

  Future<void> updatePost({
    required String docId,
    required String userId,
    required String userName,
    required String userImageUrl,
    required String postText,
    required String existingPostImageUrl,
    File? postImageFile,
  }) {
    return _postsUseCases.updatePost(
      docId: docId,
      userId: userId,
      userName: userName,
      userImageUrl: userImageUrl,
      postText: postText,
      existingPostImageUrl: existingPostImageUrl,
      postImageFile: postImageFile,
    );
  }
}
