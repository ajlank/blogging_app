import 'package:blog_app/features/profile/domain/usecases/profile_use_cases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class ProfileNotifier {
  final ProfileUseCases _profileUseCases;

  const ProfileNotifier(this._profileUseCases);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchProfileSettings(
    String userId,
  ) {
    return _profileUseCases.watchProfileSettings(userId);
  }

  Future<int> getUserPostCount(String userId) {
    return _profileUseCases.getUserPostCount(userId);
  }

  Future<int> getUserReactionCount(String userId) {
    return _profileUseCases.getUserReactionCount(userId);
  }

  Future<void> saveProfileSettings({
    required String userId,
    required String name,
    required String about,
    File? coverFile,
    File? profileFile,
  }) {
    return _profileUseCases.saveProfileSettings(
      userId: userId,
      name: name,
      about: about,
      coverFile: coverFile,
      profileFile: profileFile,
    );
  }
}
