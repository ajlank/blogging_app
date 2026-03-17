// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:blog_app/blogging.dart';
import 'package:blog_app/features/auth/data/repositories/fake_auth_repository.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:blog_app/main.dart';

void main() {
  testWidgets('Counter increments', (tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<AuthRepository>(
            create: (_) => FakeAuthRepository(),
          ),
          ProxyProvider<AuthRepository, LoginUserUseCase>(
            update: (_, authRepo, __) => LoginUserUseCase(authRepo),
          ),
          ProxyProvider<AuthRepository, SignUpUserUseCase>(
            update: (_, authRepo, __) => SignUpUserUseCase(authRepo),
          ),
          ProxyProvider2<LoginUserUseCase, SignUpUserUseCase, AuthNotifier>(
            update: (_, login, signup, __) => AuthNotifier(login, signup),
          ),
          // Add other providers your test needs
        ],
        child: MyApp(),
      ),
    );

    // Your test logic
  });
}