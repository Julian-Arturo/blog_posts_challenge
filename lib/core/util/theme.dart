import "package:flutter/material.dart";
import "package:blog_posts_challenge/core/util/colors.dart";

/// Clase que proporciona una configuración de tema personalizada para la aplicación.
class ThemeUtil {
  final ThemeData theme = ThemeData(
    applyElevationOverlayColor: true,
    primaryColor: appPrimary,
    colorScheme: const ColorScheme(
      brightness: Brightness.light, // Define que el esquema de colores es para un tema claro
      primary: appPrimaryBase, // Color principal del esquema
      onPrimary: appOnPrimary, // Color para los elementos sobre el color primario
      secondary: appSecondaryBase, // Color secundario del esquema
      onSecondary: appOnSecondary, // Color para los elementos sobre el color secundario
      error: appError, // Color para los estados de error
      onError: appError, // Color para los elementos sobre el color de error
      surface: appSurface, // Color de superficie para fondos de componentes
      onSurface: appOnSurface, // Color para los elementos sobre la superficie
    ),
  );
}
