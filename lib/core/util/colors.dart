import 'package:flutter/material.dart';

/// Esquema de colores
/// Color base primario para la aplicación
const appPrimaryBase = Color(0xFF5C84F1);
const appSecondaryBase = Color(0xFFFFC107);

/// Definición de la paleta de colores primarios con diferentes tonos
const appPrimary = MaterialColor(
  0xFF5C84F1,
  {
    50: Color(0xFFE3E9FF), // Color más claro
    100: Color(0xFFC4D3FF), // Color muy claro
    500: Color(0xFF5C84F1), // Color base primario
    900: Color(0xFF1A3A8D), // Color más oscuro
  },
);

/// Definición de la paleta de colores secundarios con diferentes tonos
const appSecondary = MaterialColor(0xFFFFC107, {
  50: Color(0xFFFFF8E1), // Color más claro
  500: Color(0xFFFFC107), // Color base secundario
  900: Color(0xFFE65100), // Color más oscuro
});

// Colores adicionales
const appBackground = Color(0xFFF6F6F6);
const appOnPrimary = Color(0xFFFFFFFF);
const appOnBorder = Color(0xFFC9C9C9);
const appOnSurface = Color(0xFF000000);
const appError = Color(0xFFFF0000);
const appSurface = Color(0xFFFFFFFF);
const appOnSecondary = Color(0xFF000000);
const showModal = Color(0xFF4A9A5E);
const showModalBackground = Color(0xFF1F2C34);


/// Función para obtener el color primario con diferentes niveles de opacidad
Color onPrimaryEmphasis(Emphasis emphasis) {
  switch (emphasis) {
    case Emphasis.high:
      return appPrimaryBase; // Opacidad completa
    case Emphasis.medium:
      return appPrimaryBase.withOpacity(0.74); // Opacidad media
    case Emphasis.disabled:
    default:
      return appPrimaryBase.withOpacity(0.38); // Opacidad baja
  }
}

const List<Color> colorPalette = [
  appPrimaryBase,
  appSecondaryBase,
  appOnSecondary,
];

/// Enum que define los diferentes niveles de énfasis
enum Emphasis { high, medium, disabled }
