import 'package:blog_posts_challenge/core/util/show_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('showCustomDialog muestra el diálogo con título, contenido y botón', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                showCustomDialog(
                  context: context,
                  title: 'Título de Prueba',
                  content: 'Este es un contenido de prueba.',
                  buttonText: 'OK',
                  onButtonPressed: () {},
                );
              },
              child: const Text('Mostrar Diálogo'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Mostrar Diálogo'));
    await tester.pumpAndSettle();

    expect(find.text('Título de Prueba'), findsOneWidget);
    expect(find.text('Este es un contenido de prueba.'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
  });

  testWidgets('showCustomDialog muestra el texto del botón por defecto cuando buttonText es nulo', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                showCustomDialog(
                  context: context,
                  title: 'Título de Prueba',
                  content: 'Este es un contenido de prueba.',
                  buttonText: null,
                  onButtonPressed: () {},
                );
              },
              child: const Text('Mostrar Diálogo'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Mostrar Diálogo'));
    await tester.pumpAndSettle();

    expect(find.text('Título de Prueba'), findsOneWidget);
    expect(find.text('Este es un contenido de prueba.'), findsOneWidget);
    expect(find.text('Aceptar'), findsOneWidget);
  });
}
