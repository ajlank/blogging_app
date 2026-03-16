import 'package:blog_app/features/notifications/presentation/controllers/notification_notifier.dart';
import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:blog_app/features/auth/presentation/notifiers/auth_error_notifier.dart';
import 'package:blog_app/core/generics/dialog.dart';
import 'package:blog_app/core/utils/constants/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _auth;

  const FirebaseAuthRepository(this._auth);

  @override
  Future<bool> loginUser(
    String email,
    String pass,
    BuildContext context,
  ) async {
    try {
      final userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      if (userCred.user != null) {
        if(context.mounted){
          context.read<NotificationNotifier>().setNotifRecieverId(
          userCred.user!.uid,
        );
        }
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
       if(context.mounted){
         await showErrorDialog('Error', 'User not found', context);
       }
        return false;
      } else if (e.code == 'wrong-password') {
       if(context.mounted){
          context.read<AuthErrorNotifier>().setPasswordError('Wrong password');
       }
        return false;
      } else {
       if(context.mounted){
         await showErrorDialog('Unknown error occurred', e.code, context);
       }
        return false;
      }
    } catch (e) {
      if(context.mounted){
        await showErrorDialog(
        'Unknown error occured',
        e.toString(),
        context,
      );
      }
      return false;
    }
  }

  @override
  Future<void> signUpUser(
    String email,
    String pass,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      if(context.mounted){
       Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       if(context.mounted){
         context.read<AuthErrorNotifier>().setPasswordError(
          'Weak password! try another',
        );
       }
      } else if (e.code == 'email-already-in-use') {
        if(context.mounted){
          context.read<AuthErrorNotifier>().setEmailError(
          
          'Email already exists! try another',
        );
        }
      } else if (e.code == 'invalid-email') {
       if(context.mounted){
         context.read<AuthErrorNotifier>().setEmailError(
          'Invalid email (correct: example@something.com)',
        );
       }
      } else {
        if(context.mounted){
          return await showErrorDialog('An error occurred', e.code, context);
        }
       
      }
    } catch (e) {
     if(context.mounted){
       return await showErrorDialog('An error occured', e.toString(), context);
     }
    }
  }
}
