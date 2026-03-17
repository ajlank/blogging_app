import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/src/widgets/framework.dart';

class FakeAuthRepository implements AuthRepository {
 

  Stream<User?> get authStateChanges async* {
    yield User(id: 'fake-id', email: 'test@test.com');
  }

  @override
  Future<bool> loginUser(String email, String pass, BuildContext context) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<void> signUpUser(String email, String pass, BuildContext context) {
    // TODO: implement signUpUser
    throw UnimplementedError();
  }
}
class User {
  final String id;
  final String email;

  User({required this.id, required this.email});
}