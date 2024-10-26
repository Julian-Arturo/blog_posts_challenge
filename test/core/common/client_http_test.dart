import 'dart:async';
import 'dart:io';
import 'package:blog_posts_challenge/core/common/client_http.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'client_http_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ClientHttp clientHttp;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    clientHttp = ClientHttp();
    clientHttp.setHttpClient(mockClient); 
  });

  group('ClientHttp', () {
    test('Debe retornar HttpResponseModel en solicitud GET exitosa', () async {
      const endpoint = 'posts';
      const jsonResponse = '[{"id": 1, "title": "Test Title"}]';
      when(mockClient.get(any)).thenAnswer((_) async =>
          http.Response(jsonResponse, 200)); 

      final response = await clientHttp.get(endpoint: endpoint);

      expect(response.body, jsonResponse);
      expect(response.message, isNull);
    });

    test('Debe retornar HttpResponseModel con mensaje de error en respuesta no 200', () async {
      const endpoint = 'posts';
      const jsonResponse = 'Not Found';
      when(mockClient.get(any)).thenAnswer((_) async =>
          http.Response(jsonResponse, 404)); 

      final response = await clientHttp.get(endpoint: endpoint);

      expect(response.body, isNull);
      expect(response.message, 'Error 404: Not Found');
    });

    test('Debe retornar mensaje de timeout en TimeoutException', () async {
      const endpoint = 'posts';
      when(mockClient.get(any)).thenAnswer((_) async =>
          Future.delayed(const Duration(seconds: 5), () => throw TimeoutException('Timeout')));

      final response = await clientHttp.get(endpoint: endpoint);

      expect(response.body, contains('Timeout'));
      expect(response.message, clientHttp.timeoutMessage);
    });

    test('Debe retornar mensaje de error de internet en SocketException', () async {
      const endpoint = 'posts';
      when(mockClient.get(any)).thenThrow(const SocketException('No internet'));

      final response = await clientHttp.get(endpoint: endpoint);

      expect(response.body, contains('No internet'));
      expect(response.message, clientHttp.errorInternet);
    });

    test('Debe retornar mensaje de error de servicio en Exception general', () async {
      const endpoint = 'posts';
      when(mockClient.get(any)).thenThrow(Exception('Unknown error'));

      final response = await clientHttp.get(endpoint: endpoint);

      expect(response.body, contains('Unknown error'));
      expect(response.message, clientHttp.serviceError);
    });
  });
}
