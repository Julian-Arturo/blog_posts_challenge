import "package:blog_posts_challenge/routes.dart";
import "package:flutter/material.dart";
import "package:blog_posts_challenge/core/util/theme.dart" as t;

/// El widget de la aplicación principal.
/// Este widget es la raíz de la aplicación y se encarga de configurar
/// la [MaterialApp] con el enrutador.
class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  /// Construye el árbol de widgets de la aplicación.
  /// Devuelve una instancia de [MaterialApp] con el enrutador configurado.
  Widget build(BuildContext context) {
    return MaterialApp.router(
      /// Oculta la banda de depuración.
      debugShowCheckedModeBanner: false,
      /// El título de la aplicación.
      title: "Blog Post Challenge",
      /// El tema de la aplicación.
      theme: t.ThemeUtil().theme,
      /// El analizador de información de ruta.
      routeInformationParser: router.routeInformationParser,
      /// El delegado del enrutador.
      routerDelegate: router.routerDelegate,
      /// El proveedor de información de ruta.
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}