import 'package:blog_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class FirebaseProfileRepository implements ProfileRepository {
  final FirebaseFirestore _firestore;

  FirebaseProfileRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchProfileSettings(
    String userId,
  ) {
    return _firestore
        .collection('profilesettings')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  @override
  Future<int> getUserPostCount(String userId) async {
    final snapshot = await _firestore
        .collection('posts')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.length;
  }

  @override
  Future<int> getUserReactionCount(String userId) async {
    double totalReaction = 0;
    final snapshots = await _firestore
        .collection('posts')
        .where('userId', isEqualTo: userId)
        .get();

    for (var doc in snapshots.docs) {
      totalReaction += doc.data()['likeCount'] ?? 0;
    }
    return totalReaction.toInt();
  }

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
      print('Cloudinary upload failed: ${response.statusCode}');
      return null;
    }
  }

  @override
  Future<void> saveProfileSettings({
    required String userId,
    required String name,
    required String about,
    File? coverFile,
    File? profileFile,
  }) async {
    try {
      String? coverImageUrl;
      String? profileImageUrl;

      if (coverFile != null) {
        coverImageUrl = await _uploadToCloudinary(coverFile);
      }
      if (profileFile != null) {
        profileImageUrl = await _uploadToCloudinary(profileFile);
      }

      await _firestore.collection("profilesettings").add({
        "userId": userId,
        "name": name.trim(),
        "about": about.trim(),
        "postedAt": FieldValue.serverTimestamp(),
        "profileImageUrl": profileImageUrl ?? "",
        "coverImageUrl": coverImageUrl ?? "",
      });

      await _firestore.collection('curentUser').doc(userId).collection('user').add({
        "userId": userId,
        "name": name.trim(),
        "profileImageUrl": profileImageUrl ?? "",
      });
    } catch (e) {
      print(e);
    }
  }
}
