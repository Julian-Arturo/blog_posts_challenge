import 'package:blog_posts_challenge/feature/splash/splash_page.dart';
import 'package:blog_posts_challenge/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SplashScreen debería construirse correctamente', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(const BlocsProvider());
      expect(find.byType(SplashScreen), findsOneWidget);
    });
  });
}
