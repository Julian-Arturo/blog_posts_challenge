import 'package:blog_posts_challenge/core/common/client_http.dart';
import 'package:blog_posts_challenge/core/common/models/http_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/data/data_source/post_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'post_data_source_test.mocks.dart';

@GenerateMocks([ClientHttp])
void main() {
  late MockClientHttp mockClientHttp;
  late PostDataSourceImpl postDataSource;

  setUp(() {
    mockClientHttp = MockClientHttp();
    postDataSource = PostDataSourceImpl(mockClientHttp);
  });

  group('PostDataSourceImpl', () {
    test('Debería devolver HttpResponseModel cuando getAllPosts se llama exitosamente', () async {
      final expectedResponse = HttpResponseModel(
        body: '[{"userId": 1, "id": 1, "title": "Publicación 1", "body": "Contenido 1", "image": "imagen.jpg"}]', 
        message: null
      );
      when(mockClientHttp.get(endpoint: anyNamed('endpoint'))).thenAnswer((_) async => expectedResponse);
      final response = await postDataSource.getAllPosts();
      
      expect(response.body, expectedResponse.body);
      expect(response.message, expectedResponse.message);
      verify(mockClientHttp.get(endpoint: 'posts')).called(1);
      verifyNoMoreInteractions(mockClientHttp);
    });

    test('Debería lanzar una excepción cuando getAllPosts falla', () async {
      when(mockClientHttp.get(endpoint: anyNamed('endpoint'))).thenThrow(Exception('Ocurrió un error'));
      
      expect(() async => await postDataSource.getAllPosts(), throwsException);
      verify(mockClientHttp.get(endpoint: 'posts')).called(1);
    });

    test('Debería devolver un HttpResponseModel vacío cuando el servicio responde con cuerpo nulo', () async {
      final expectedResponse = HttpResponseModel(body: null, message: 'Error del servicio');
      when(mockClientHttp.get(endpoint: anyNamed('endpoint'))).thenAnswer((_) async => expectedResponse);
      final response = await postDataSource.getAllPosts();
      
      expect(response.body, isNull);
      expect(response.message, 'Error del servicio');
      verify(mockClientHttp.get(endpoint: 'posts')).called(1);
    });
  });
}
