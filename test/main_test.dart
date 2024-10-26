import 'package:blog_posts_challenge/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:blog_posts_challenge/main.dart';
import 'core/startup.dart';
import 'get_injection/get_injection.dart';

void main() {
  GetIt sl = GetIt.instance;

  setUpAll(() {
    configureTestDependencies(sl);
  });

  tearDownAll(() {
    sl.reset();
  });

  testWidgets('Debería iniciar BlocsProvider y la aplicación correctamente', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(const BlocsProvider());
      await tester.pumpAndSettle();
      
      expect(find.byType(BlocsProvider), findsOneWidget);
      expect(find.byType(App), findsOneWidget);
    });
  });

  testWidgets('Debería inicializar las dependencias y lanzar BlocsProvider', (WidgetTester tester) async {
    await tester.runAsync(() async {
      startApp();
      await tester.pumpAndSettle();

      expect(find.byType(BlocsProvider), findsOneWidget);
      expect(find.byType(App), findsOneWidget);
    });
  });
}
