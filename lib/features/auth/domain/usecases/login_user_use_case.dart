import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/widgets.dart';

class LoginUserUseCase {
  final AuthRepository _authRepository;

  const LoginUserUseCase(this._authRepository);

  Future<bool> call(String email, String pass, BuildContext context) {
    return _authRepository.loginUser(email, pass, context);
  }
}
