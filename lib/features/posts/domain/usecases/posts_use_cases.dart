import 'dart:io';
import 'package:blog_app/features/posts/domain/repositories/posts_repository.dart';

class PostsUseCases {
  final PostsRepository _postsRepository;

  const PostsUseCases(this._postsRepository);

  Future<void> createPost({
    required String userId,
    required String userName,
    required String userImageUrl,
    required String postText,
    File? postImageFile,
  }) {
    return _postsRepository.createPost(
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
    return _postsRepository.updatePost(
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
