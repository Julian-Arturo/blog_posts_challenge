import 'package:blog_posts_challenge/core/util/colors.dart';
import 'package:flutter/material.dart';

/// Muestra un diálogo personalizado en la aplicación.
/// 
/// - `context`: El contexto en el que se construye el diálogo.
/// - `title`: El título del diálogo, puede ser nulo.
/// - `content`: El contenido del diálogo, puede ser nulo.
/// - `buttonText`: El texto que se muestra en el botón, puede ser nulo.
/// - `onButtonPressed`: La función que se ejecuta cuando se presiona el botón, puede ser nula.
void showCustomDialog({
  required BuildContext context,
  String? title,
  String? content,
  String? buttonText,
  void Function()? onButtonPressed,
}) {
  showDialog(
    context: context,
    builder: (context) => _buildAlertDialog(
      title: title,
      content: content,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
    ),
  );
}

/// Construye un diálogo de alerta personalizado.
AlertDialog _buildAlertDialog({
  String? title,
  String? content,
  String? buttonText,
  void Function()? onButtonPressed,
}) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: showModalBackground,
    title: _buildDialogTitle(title),
    content: SingleChildScrollView( 
      child: _buildDialogContent(content),
    ),
    actions: [_buildDialogButton(buttonText, onButtonPressed)],
    elevation: 10,
  );
}

/// Se construye el título del diálogo.
Widget _buildDialogTitle(String? title) {
  return Text(
    title ?? "",
    style: const TextStyle(
      color: appBackground,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
  );
}

/// Se construye el contenido del diálogo.
Widget _buildDialogContent(String? content) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      content ?? "",
      style: const TextStyle(
        color: appOnBorder,
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

/// Se construye el botón del diálogo.
Widget _buildDialogButton(String? buttonText, void Function()? onButtonPressed) {
  return SizedBox(
    width: double.infinity, 
    child: TextButton(
      onPressed: onButtonPressed,
      style: TextButton.styleFrom(
        backgroundColor: showModal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(
        buttonText ?? "Aceptar",
        style: const TextStyle(
          color: appBackground,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
