import 'dart:convert';
import 'package:blog_posts_challenge/core/common/failures/failure.dart';
import 'package:blog_posts_challenge/core/common/models/http_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/data/data_source/post_data_source.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/data/repositories/post_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'post_repository_impl_test.mocks.dart';

@GenerateMocks([PostDataSource])
void main() {
  late MockPostDataSource mockDataSource;
  late PostRepositoryImpl postRepository;

  setUp(() {
    mockDataSource = MockPostDataSource();
    postRepository = PostRepositoryImpl(mockDataSource);
  });

  group('PostRepositoryImpl', () {
    test('Debería retornar una lista de posts cuando se obtienen datos correctamente', () async {
      final response = HttpResponseModel(body: jsonEncode([
        {'userId': 1, 'id': 1, 'title': 'Post 1', 'body': 'Contenido 1'},
        {'userId': 1, 'id': 2, 'title': 'Post 2', 'body': 'Contenido 2'},
      ]));
      
      when(mockDataSource.getAllPosts()).thenAnswer((_) async => response);

      final result = await postRepository.getAllPosts();

      expect(result.isRight(), true);
      expect(result.getOrElse(() => []), isA<List<PostResponseModel>>());
      verify(mockDataSource.getAllPosts()).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test('Debería retornar un Failure cuando la respuesta tiene un mensaje de error', () async {
      final response = HttpResponseModel(body: '', message: 'Error en el servicio');
      when(mockDataSource.getAllPosts()).thenAnswer((_) async => response);

      final result = await postRepository.getAllPosts();
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => null), isA<Failure>());
      verify(mockDataSource.getAllPosts()).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test('Debería retornar un Failure cuando se lanza una excepción', () async {
      when(mockDataSource.getAllPosts()).thenThrow(Exception('Error inesperado'));
      final result = await postRepository.getAllPosts();

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => null), isA<Failure>());
      verify(mockDataSource.getAllPosts()).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
