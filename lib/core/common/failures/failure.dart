import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';  

/// Clase que representa un fallo en la aplicación.
/// 
/// Esta clase utiliza la librería Freezed para generar un modelo inmutable
/// que puede contener diferentes tipos de errores.
@freezed
class Failure with _$Failure {
  const Failure._(); // Constructor privado para evitar instancias externas.

  /// Fábrica que crea una instancia de `Failure` para errores de datos.
  /// 
  /// - `message`: Mensaje que describe el error.
  const factory Failure.data({required String message}) = _Data;
}
