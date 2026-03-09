import 'dart:io';

abstract class PostsRepository {
  Future<void> createPost({
    required String userId,
    required String userName,
    required String userImageUrl,
    required String postText,
    File? postImageFile,
  });

  Future<void> updatePost({
    required String docId,
    required String userId,
    required String userName,
    required String userImageUrl,
    required String postText,
    required String existingPostImageUrl,
    File? postImageFile,
  });
}
