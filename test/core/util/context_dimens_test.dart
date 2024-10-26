import 'package:blog_posts_challenge/core/util/context_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DimensExtension', () {
    testWidgets('width y height devuelven valores correctos', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(800, 600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final width = context.width();
                final height = context.height();
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Width: $width'),
                      Text('Height: $height'),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );

      final widthText = find.text('Width: 800.0');
      final heightText = find.text('Height: 600.0');

      expect(widthText, findsOneWidget);
      expect(heightText, findsOneWidget);
    });

    testWidgets('adjustedSize devuelve tamaños ajustados correctos', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(375, 667);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final adjustedSize = context.adjustedSize(20);
                return Center(
                  child: Text('Adjusted Size: $adjustedSize'),
                );
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      final adjustedSizeText = find.text('Adjusted Size: 20.0');

      expect(adjustedSizeText, findsOneWidget);

      tester.view.physicalSize = const Size(800, 1280);
      await tester.pumpAndSettle();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final adjustedSizeTablet = context.adjustedSize(20);
                return Center(
                  child: Text('Adjusted Size Tablet: $adjustedSizeTablet'),
                );
              },
            ),
          ),
        ),
      );

      await tester.pump();
      final adjustedSizeTabletText = find.text('Adjusted Size Tablet: 20.833333333333336');
      expect(adjustedSizeTabletText, findsOneWidget);
    });

    testWidgets('Métodos EdgeInsets devuelven valores correctos', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(800, 600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final edgeInsets = context.fromLTRB(0.1, 0.1, 0.1, 0.1);
                return Container(
                  margin: edgeInsets,
                  child: const Text('Hello'),
                );
              },
            ),
          ),
        ),
      );

      final container = tester.firstWidget<Container>(find.byType(Container));
      final margin = container.margin as EdgeInsets;

      expect(margin.left, 80.0);
      expect(margin.top, 80.0);
      expect(margin.right, 80.0);
      expect(margin.bottom, 80.0);
    });
  });
}
