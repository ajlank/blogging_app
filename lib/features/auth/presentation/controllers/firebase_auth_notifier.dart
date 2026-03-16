
// import 'package:blog_app/features/notifications/presentation/controllers/notification_notifier.dart';
// import 'package:blog_app/core/generics/dialog.dart';
// import 'package:blog_app/core/utils/constants/app_routes.dart';
// import 'package:blog_app/features/auth/presentation/controllers/auth_error_notifier.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/widgets.dart';

// import 'package:provider/provider.dart';

// class FirebaseAuthNotifier {
//   final FirebaseAuth _auth;

//   const FirebaseAuthNotifier(this._auth);

//   Future<bool> loginUser(
//     String email,
//     String pass,
//     BuildContext context,
//   ) async {
//     try {
//       final userCred = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: pass,
//       );

//       if (userCred.user != null) {
//         context.read<NotificationNotifier>().setNotifRecieverId(
//           userCred.user!.uid,
//         );
//         return true;
//       }
//       return false;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         await showErrorDialog('Error', 'User not found', context);
//         return false;
//       } else if (e.code == 'wrong-password') {
//         context.read<AuthErrorNotifier>().setPasswordError('Wrong password');
//         return false;
//       } else {
//         await showErrorDialog('Unknown error occurred', e.code, context);
//         return false;
//       }
//     } catch (e) {
//       await showErrorDialog(
//         'Unknown error occured',
//         e.toString(),
//         context,
//       );
//       return false;
//     }
//   }

//   Future<void> signUpUser(
//     String email,
//     String pass,
//     BuildContext context,
//   ) async {
//     try {
//       final userCred = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: pass);
//       Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         context.read<AuthErrorNotifier>().setPasswordError(
//           'Password is too weak! at least 6 digits required',
//         );
//       } else if (e.code == 'email-already-in-use') {
//         context.read<AuthErrorNotifier>().setEmailError(
//           'Email already exists! try another',
//         );
//       } else if (e.code == 'invalid-email') {
//         context.read<AuthErrorNotifier>().setEmailError(
//           'Invalid email (correct: example@something.com)',
//         );
//       } else {
//         return await showErrorDialog('An error occurred', e.code, context);
//       }
//     } catch (e) {
//       return await showErrorDialog('An error occured', e.toString(), context);
//     }
//   }
// }
