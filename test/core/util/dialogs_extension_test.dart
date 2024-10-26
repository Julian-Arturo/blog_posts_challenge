import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blog_posts_challenge/core/util/dialogs_extension.dart';

void main() {
  testWidgets('showLoadingDialog muestra el diálogo de carga', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                context.showLoadingDialog();
              },
              child: const Text('Mostrar Diálogo de Carga'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Mostrar Diálogo de Carga'));
    await tester.pump();

    expect(find.byType(Container), findsWidgets);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
