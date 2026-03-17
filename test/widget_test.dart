import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:blog_app/main.dart';

class MockFirebaseCore extends FirebasePlatform {
  @override
  Future<FirebaseAppPlatform> initializeApp({
    String? name,
    FirebaseOptions? options,
  }) async {
    return FirebaseAppPlatform(
      name ?? '[DEFAULT]',
      options ??
          const FirebaseOptions(
            apiKey: 'fake',
            appId: 'fake',
            messagingSenderId: 'fake',
            projectId: 'fake',
          ),
    );
  }
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    // 🔥 THIS LINE IS THE FIX
    FirebasePlatform.instance = MockFirebaseCore();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}