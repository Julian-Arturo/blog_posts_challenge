import 'package:blog_posts_challenge/core/util/collections/random_selector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas de RandomSelector', () {
    late RandomSelector<int> randomSelector;

    setUp(() {
      randomSelector = RandomSelector<int>(List.generate(5, (index) => index)); 
    });

    test('Debe lanzar una excepción cuando se inicializa con una lista vacía', () {
      expect(
        () => RandomSelector<int>([]),
        throwsA(
          isA<Exception>().having((e) => e.toString(), 'mensaje', contains('La lista no puede estar vacía'))
        ),
      );
    });

    test('Debe retornar un elemento aleatorio de la lista', () {
      final selectedItem = randomSelector.getRandomElement();
      expect(randomSelector.items, contains(selectedItem));
    });

    test('No debe retornar el mismo elemento consecutivamente', () {
      final firstSelection = randomSelector.getRandomElement();
      final secondSelection = randomSelector.getRandomElement();
      expect(firstSelection, isNot(secondSelection));
    });

    test('Debe recordar el último elemento seleccionado y no seleccionarlo de nuevo inmediatamente', () {
      final firstSelection = randomSelector.getRandomElement();
      final secondSelection = randomSelector.getRandomElement();
      expect(firstSelection, isNot(secondSelection));

      final thirdSelection = randomSelector.getRandomElement();
      expect(thirdSelection, isNot(firstSelection));
    });
  });
}
