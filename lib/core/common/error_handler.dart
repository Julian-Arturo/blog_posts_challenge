import 'dart:io';
import 'package:blog_posts_challenge/core/util/show_custom_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// coverage:ignore-file

/// Clase que maneja la gestión de errores en la aplicación.
/// 
/// Proporciona métodos para mostrar diálogos personalizados cuando ocurren errores,
/// facilitando la interacción del usuario con el sistema.
class ErrorHandler {
  static void handleErrorView(BuildContext context, String message) {
    showCustomDialog(
      context: context,
      content: "Error al cargar las publicaciones: $message",
      onButtonPressed: () => kIsWeb ? context.pop() : exit(0), 
    );
  }
}
