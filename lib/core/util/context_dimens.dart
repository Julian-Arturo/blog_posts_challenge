import "package:flutter/material.dart";

/// Extension para facilitar el acceso a las dimensiones de la pantalla y 
/// generar `EdgeInsets` basados en porcentajes relativos a la pantalla.
extension DimensExtension on BuildContext {
  
  /// Obtiene el ancho total de la pantalla.
  /// Si [value] se proporciona, retorna el ancho multiplicado por [value].
  double width([num? value]) {
    final screenWidth = MediaQuery.of(this).size.width;
    return value != null ? screenWidth * value : screenWidth;
  }

  /// Obtiene el alto total de la pantalla.
  /// Si [value] se proporciona, retorna el alto multiplicado por [value].
  double height([num? value]) {
    final screenHeight = MediaQuery.of(this).size.height;
    return value != null ? screenHeight * value : screenHeight;
  }

  /// Ajusta el tamaño según el ancho de la pantalla.
  double adjustedSize(double baseSize) {
    final screenWidth = MediaQuery.of(this).size.width;
    double scaleFactor;
    if (screenWidth < 600) {
      // Móviles (ancho menor a 600 px)
      scaleFactor = screenWidth / 375; 
    } else if (screenWidth < 1200) {
      // Tabletas (ancho entre 600 y 1200 px)
      scaleFactor = screenWidth / 768; 
    } else {
      // Pantallas grandes (web, ancho mayor a 1200 px)
      scaleFactor = screenWidth / 1440; 
    }
    return baseSize * scaleFactor;
  }

  /// Crea un [EdgeInsets] desde valores específicos para cada lado, 
  /// multiplicados por el ancho de la pantalla.
  EdgeInsets fromLTRB(num left, num top, num right, num bottom) {
    return EdgeInsets.fromLTRB(
      width(left),
      width(top),
      width(right),
      width(bottom),
    );
  }

  /// Crea un [EdgeInsets] simétrico con valores horizontales y verticales 
  /// multiplicados por el ancho de la pantalla.
  EdgeInsets symmetric(num horizontal, num vertical) {
    return EdgeInsets.symmetric(
      horizontal: width(horizontal),
      vertical: width(vertical),
    );
  }

  /// Crea un [EdgeInsets] con el mismo valor para todos los lados, 
  /// multiplicado por el ancho de la pantalla.
  EdgeInsets all(num value) => EdgeInsets.all(width(value));

  /// Crea un [EdgeInsets] con un valor específico para los márgenes horizontales, 
  /// multiplicado por el ancho de la pantalla.
  EdgeInsets horizontal(num value) => EdgeInsets.symmetric(horizontal: width(value));

  /// Crea un [EdgeInsets] con un valor específico para los márgenes verticales, 
  /// multiplicado por el ancho de la pantalla.
  EdgeInsets vertical(num value) => EdgeInsets.symmetric(vertical: width(value));

  /// Crea un [EdgeInsets] con un valor específico para el margen superior, 
  /// multiplicado por el ancho de la pantalla.
  EdgeInsets top(num value) => EdgeInsets.only(top: width(value));

  /// Crea un [EdgeInsets] con un valor específico para el margen izquierdo, 
  /// multiplicado por el ancho de la pantalla.
  EdgeInsets left(num value) => EdgeInsets.only(left: width(value));

  /// Crea un [EdgeInsets] con un valor específico para el margen derecho, 
  /// multiplicado por el ancho de la pantalla.
  EdgeInsets right(num value) => EdgeInsets.only(right: width(value));

  /// Crea un [EdgeInsets] con un valor específico para el margen inferior, 
  /// multiplicado por el ancho de la pantalla.
  EdgeInsets bottom(num value) => EdgeInsets.only(bottom: width(value));
}
