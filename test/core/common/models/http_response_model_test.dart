import 'package:blog_posts_challenge/core/common/models/http_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas de HttpResponseModel', () {
    test('debe crear una instancia desde JSON', () {
      final json = {
        'body': 'Este es el cuerpo de la respuesta',
        'message': 'Éxito',
      };

      final httpResponse = HttpResponseModel.fromJson(json);

      expect(httpResponse.body, 'Este es el cuerpo de la respuesta');
      expect(httpResponse.message, 'Éxito');
    });

    test('debe convertir una instancia a JSON', () {
      final httpResponse = HttpResponseModel(
        body: 'Este es el cuerpo de la respuesta',
        message: 'Éxito',
      );

      final json = httpResponse.toJson();

      expect(json, {
        'body': 'Este es el cuerpo de la respuesta',
        'message': 'Éxito',
      });
    });

    test('debe manejar valores nulos', () {
      final httpResponse = HttpResponseModel();

      final json = httpResponse.toJson();
      expect(json, {
        'body': null,
        'message': null,
      });

      final responseFromJson = HttpResponseModel.fromJson({});
      expect(responseFromJson.body, null);
      expect(responseFromJson.message, null);
    });
  });
}
