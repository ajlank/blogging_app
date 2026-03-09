import 'package:blog_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class ProfileUseCases {
  final ProfileRepository _profileRepository;

  const ProfileUseCases(this._profileRepository);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchProfileSettings(
    String userId,
  ) {
    return _profileRepository.watchProfileSettings(userId);
  }

  Future<int> getUserPostCount(String userId) {
    return _profileRepository.getUserPostCount(userId);
  }

  Future<int> getUserReactionCount(String userId) {
    return _profileRepository.getUserReactionCount(userId);
  }

  Future<void> saveProfileSettings({
    required String userId,
    required String name,
    required String about,
    File? coverFile,
    File? profileFile,
  }) {
    return _profileRepository.saveProfileSettings(
      userId: userId,
      name: name,
      about: about,
      coverFile: coverFile,
      profileFile: profileFile,
    );
  }
}
