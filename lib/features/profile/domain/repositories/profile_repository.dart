import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

abstract class ProfileRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> watchProfileSettings(
    String userId,
  );

  Future<int> getUserPostCount(String userId);

  Future<int> getUserReactionCount(String userId);

  Future<void> saveProfileSettings({
    required String userId,
    required String name,
    required String about,
    File? coverFile,
    File? profileFile,
  });

  Future<void> updateProfileSettings({
    required String docId,
    required String userId,
    required String name,
    required String about,
    File? coverFile,
    File? profileFile,
  });
}
