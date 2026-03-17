import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      default:
        throw UnsupportedError('Platform not supported');
    }
  }

  static FirebaseOptions get web => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_WEB_API_KEY']!,
        appId: dotenv.env['FIREBASE_WEB_APP_ID']!,
        messagingSenderId: dotenv.env['FIREBASE_WEB_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['FIREBASE_WEB_PROJECT_ID']!,
        authDomain: dotenv.env['FIREBASE_WEB_AUTH_DOMAIN']!,
        databaseURL: dotenv.env['FIREBASE_WEB_DATABASE_URL']!,
        storageBucket: dotenv.env['FIREBASE_WEB_STORAGE_BUCKET']!,
        measurementId: dotenv.env['FIREBASE_WEB_MEASUREMENT_ID']!,
      );

  static FirebaseOptions get android => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_ANDROID_API_KEY']!,
        appId: dotenv.env['FIREBASE_ANDROID_APP_ID']!,
        messagingSenderId: dotenv.env['FIREBASE_WEB_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['FIREBASE_WEB_PROJECT_ID']!,
        databaseURL: dotenv.env['FIREBASE_WEB_DATABASE_URL']!,
        storageBucket: dotenv.env['FIREBASE_WEB_STORAGE_BUCKET']!,
      );

  static FirebaseOptions get ios => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_IOS_API_KEY']!,
        appId: dotenv.env['FIREBASE_IOS_APP_ID']!,
        messagingSenderId: dotenv.env['FIREBASE_WEB_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['FIREBASE_WEB_PROJECT_ID']!,
        databaseURL: dotenv.env['FIREBASE_WEB_DATABASE_URL']!,
        storageBucket: dotenv.env['FIREBASE_WEB_STORAGE_BUCKET']!,
        androidClientId: dotenv.env['FIREBASE_IOS_ANDROID_CLIENT_ID']!,
        iosClientId: dotenv.env['FIREBASE_IOS_IOS_CLIENT_ID']!,
        iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID']!,
      );

  static FirebaseOptions get macos => ios;
}