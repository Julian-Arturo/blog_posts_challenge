import 'package:blog_posts_challenge/feature/blog/presentation/blog_screen.dart';
import 'package:blog_posts_challenge/feature/splash/splash_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Clase `Routes` que define las rutas de la aplicación como constantes.
/// Centraliza y simplifica el mantenimiento del código, evitando errores tipográficos
/// y facilitando actualizaciones en las rutas.
class Routes {
  static const String splash = '/';
  static const String blog = '/blog';
}

/// Clave global de navegación para controlar rutas desde cualquier parte de la aplicación.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Configuración de las rutas de la aplicación usando GoRouter.
final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: kIsWeb ? Routes.blog : Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      pageBuilder: (context, state) => _buildPage(state: state, child: const SplashScreen()),
    ),
    GoRoute(
      path: Routes.blog,
      pageBuilder: (context, state) => _buildPage(state: state, child: const BlogScreen()),
    ),
  ],
);

/// Crea una página sin animación de transición para cambios rápidos de pantalla.
/// Se utiliza para evitar transiciones innecesarias y mejorar la experiencia de usuario.
Page<void> _buildPage({required GoRouterState state, required Widget child}) {
  return NoTransitionPage<void>(
    key: state.pageKey,
    child: child,
  );
}
