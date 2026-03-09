import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/widgets.dart';

class SignUpUserUseCase {
  final AuthRepository _authRepository;

  const SignUpUserUseCase(this._authRepository);

  Future<void> call(String email, String pass, BuildContext context) {
    return _authRepository.signUpUser(email, pass, context);
  }
}
