import 'package:blog_posts_challenge/core/util/animations_paths.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas de AnimationsPaths', () {
    test('debe tener la ruta correcta para la animación de carga del blog', () {
      expect(animationsPaths.loadingblog, 'assets/lottie/loadingblog.json');
    });

    test('debe tener la ruta correcta para la animación de splash', () {
      expect(animationsPaths.splash, 'assets/lottie/splash.json');
    });
  });
}
