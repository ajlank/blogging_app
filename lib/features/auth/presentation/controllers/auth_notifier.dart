import 'package:blog_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:flutter/widgets.dart';

class AuthNotifier {
  final LoginUserUseCase _loginUserUseCase;
  final SignUpUserUseCase _signUpUserUseCase;

  const AuthNotifier(this._loginUserUseCase, this._signUpUserUseCase);

  Future<bool> loginUser(
    String email,
    String pass,
    BuildContext context,
  ) async {
    return _loginUserUseCase(email, pass, context);
  }

  Future<void> signUpUser(
    String email,
    String pass,
    BuildContext context,
  ) async {
    return _signUpUserUseCase(email, pass, context);
  }
}
