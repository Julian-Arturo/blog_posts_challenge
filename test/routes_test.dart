import 'package:blog_posts_challenge/feature/blog/presentation/blog_screen.dart';
import 'package:blog_posts_challenge/feature/splash/splash_page.dart';
import 'package:blog_posts_challenge/routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:blog_posts_challenge/main.dart';
import 'get_injection/get_injection.dart';

void main() {
  GetIt sl = GetIt.instance;

  setUpAll(() {
    configureTestDependencies(sl);
  });

  tearDownAll(() {
    GetIt.instance.reset();
  });

  testWidgets('Navegar a la pantalla SplashScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const BlocsProvider());
    await tester.pumpAndSettle();
    expect(find.byType(SplashScreen), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.byType(BlogScreen), findsOneWidget);
  });

  testWidgets('Navegar a la pantalla del blog', (WidgetTester tester) async {
    await tester.pumpWidget(const BlocsProvider());
    await tester.pumpAndSettle(const Duration(seconds: 7));
    GoRouter.of(navigatorKey.currentContext!).go(Routes.blog);
    await tester.pumpAndSettle();
    expect(find.byType(BlogScreen), findsOneWidget);
  });
}
