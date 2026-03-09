import 'package:flutter/widgets.dart';

abstract class AuthRepository {
  Future<bool> loginUser(String email, String pass, BuildContext context);

  Future<void> signUpUser(String email, String pass, BuildContext context);
}
