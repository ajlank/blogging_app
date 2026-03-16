import 'dart:convert';
import 'dart:io';
import 'package:blog_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class FirebasePostsRepository implements PostsRepository {
  final FirebaseFirestore _firestore;

  FirebasePostsRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<String?> _uploadToCloudinary(File file) async {
    final cloudName = 'dyn1z1hjj';
    final uploadPreset = 'flutter_upload';

    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    final mimeType = lookupMimeType(file.path)!.split('/');

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          contentType: MediaType(mimeType[0], mimeType[1]),
        ),
      );

    final response = await request.send();

    if (response.statusCode == 200) {
      final resData = await http.Response.fromStream(response);
      final jsonData = jsonDecode(resData.body);
      return jsonData['secure_url'];
    } else {

      return null;
    }
  }

  @override
  Future<void> createPost({
    required String userId,
    required String userName,
    required String userImageUrl,
    required String postText,
    File? postImageFile,
  }) async {
    String? postImageUrl;

    if (postImageFile != null) {
      postImageUrl = await _uploadToCloudinary(postImageFile);
    }

    final postDoc = _firestore.collection("posts").doc(userId);

    await postDoc.set({
      "documentId": postDoc.id,
      "userId": userId,
      "userName": userName,
      "userPostText": postText,
      "userImageUrl": userImageUrl,
      "postImageUrl": postImageUrl ?? "",
      "postedAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> updatePost({
    required String docId,
    required String userId,
    required String userName,
    required String userImageUrl,
    required String postText,
    required String existingPostImageUrl,
    File? postImageFile,
  }) async {
    String? postImageUrl;

    if (postImageFile != null) {
      postImageUrl = await _uploadToCloudinary(postImageFile);
    }

    final postDoc = _firestore.collection("posts").doc(docId);

    await postDoc.update({
      "documentId": postDoc.id,
      "userId": userId,
      "userName": userName,
      "userPostText": postText,
      "userImageUrl": userImageUrl,
      "postImageUrl":
          existingPostImageUrl.isNotEmpty
              ? existingPostImageUrl
              : postImageUrl ?? '',
      "postedAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
    });
  }
}
