import "package:flutter/material.dart";
import "package:go_router/go_router.dart";


/// Esta extensión agrega métodos útiles para manejar diálogos de carga
/// a la clase BuildContext.
extension DialogsExtension on BuildContext {
  
  /// Muestra un diálogo de carga que presenta una animación mientras la aplicación está procesando.
  /// El diálogo no se puede cerrar manualmente (barrierDismissible: false).
void showLoadingDialog() => showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child:const Center(child: CircularProgressIndicator())
          ),
        );
      },
    );


  /// Oculta el diálogo de carga si es visible.
  /// Utiliza la función `pop` para cerrar el diálogo.
  void hideLoadingDialog() {
    if (canPop()) {
      pop();
    }
  }
}



