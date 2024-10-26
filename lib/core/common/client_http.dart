import 'dart:async';
import 'dart:io';
import 'package:blog_posts_challenge/core/common/models/http_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

/// Clase que gestiona las solicitudes HTTP en la aplicación.
/// 
/// Proporciona métodos para realizar peticiones GET y maneja errores comunes,
/// devolviendo un modelo de respuesta estandarizado.
@injectable
class ClientHttp {
  http.Client client = http.Client(); 
  final String timeoutMessage = 'Latencia'; 
  final String errorInternet = 'Sin internet';
  final String serviceError = 'Service Error'; 

  void setHttpClient(http.Client client) {
    this.client = client;
  }

  /// Devuelve un `HttpResponseModel` que contiene el cuerpo de la respuesta
  Future<HttpResponseModel> get({required String endpoint}) async {
    final String url = 'https://jsonplaceholder.typicode.com/$endpoint'; 

    try {
      var response = await client.get(Uri.parse(url)).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw TimeoutException("Timeout"),
      );
      return response.validateResponse(); 
    } on TimeoutException catch (e) {
      // Manejo de excepciones por tiempo de espera.
      return HttpResponseModel(body: "$e", message: timeoutMessage);
    } on SocketException catch (e) {
      // Manejo de excepciones por falta de conexión a internet.
      return HttpResponseModel(body: "$e", message: errorInternet);
    } catch (e) {
      // Manejo de cualquier otra excepción no específica.
      return HttpResponseModel(body: "$e", message: serviceError);
    }
  }
}

// Extensión para validar la respuesta y mapear a HttpResponseModel
extension HttpUtils on http.Response {
  HttpResponseModel validateResponse() {
    if (statusCode == 200 || statusCode == 201) {
      return HttpResponseModel(
        body: body,
        message: null,
      );
    } else {
      return HttpResponseModel(
        body: null,
        message: 'Error $statusCode: $body',
      );
    }
  }
}
