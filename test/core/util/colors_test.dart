import 'package:blog_posts_challenge/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas del esquema de colores', () {
    test('El color primario debe coincidir con el valor definido', () {
      expect(appPrimaryBase, const Color(0xFF5C84F1));
    });

    test('El color secundario debe coincidir con el valor definido', () {
      expect(appSecondaryBase, const Color(0xFFFFC107));
    });

    test('La paleta de colores debe contener valores correctos', () {
      expect(colorPalette, containsAllInOrder([
        appPrimaryBase,
        appSecondaryBase,
        appOnSecondary,
      ]));
    });

    test('El color primario con alta énfasis debe ser opaco', () {
      final highEmphasisColor = onPrimaryEmphasis(Emphasis.high);
      expect(highEmphasisColor, appPrimaryBase);
    });

    test('El color primario con énfasis medio debe tener la opacidad correcta', () {
      final mediumEmphasisColor = onPrimaryEmphasis(Emphasis.medium);
      expect(mediumEmphasisColor, appPrimaryBase.withOpacity(0.74));
    });

    test('El color primario con énfasis deshabilitado debe tener la opacidad correcta', () {
      final disabledEmphasisColor = onPrimaryEmphasis(Emphasis.disabled);
      expect(disabledEmphasisColor, appPrimaryBase.withOpacity(0.38));
    });
  });
}
