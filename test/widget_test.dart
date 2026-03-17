import 'package:blog_app/blogging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blog_app/main.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Use fake options for CI/CD tests
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'fake_key',
        appId: 'fake_appId',
        messagingSenderId: 'fake_senderId',
        projectId: 'fake_projectId',
      ),
    );
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify initial counter
    expect(find.text('0'), findsOneWidget);

    // Tap + and rebuild
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify increment
    expect(find.text('1'), findsOneWidget);
  });
}