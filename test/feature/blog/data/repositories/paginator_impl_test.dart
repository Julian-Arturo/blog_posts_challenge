import 'package:blog_posts_challenge/core/common/failures/failure.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/data/repositories/paginator_impl.dart';
import 'package:blog_posts_challenge/feature/blog/domain/use_case/post_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'paginator_impl_test.mocks.dart';

@GenerateMocks([GetPostsUseCase])
void main() {
  late MockGetPostsUseCase mockGetPostsUseCase;
  late PostPaginator postPaginator;

  setUp(() {
    mockGetPostsUseCase = MockGetPostsUseCase();
    postPaginator = PostPaginator(mockGetPostsUseCase);
  });

  group('PostPaginator', () {
    test('Debería obtener y almacenar en caché los posts cuando la caché está vacía', () async {
      final posts = [
        PostResponseModel(userId: 1, id: 1, title: 'Post 1', body: 'Contenido 1', image: ''),
        PostResponseModel(userId: 1, id: 2, title: 'Post 2', body: 'Contenido 2', image: ''),
      ];
      when(mockGetPostsUseCase.getAllPosts()).thenAnswer((_) async => Right(posts));
      final result = await postPaginator.fetchItems(0, 2);

      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => []), posts);
      expect(postPaginator.cachedPosts.length, posts.length);
      verify(mockGetPostsUseCase.getAllPosts()).called(1);
      verifyNoMoreInteractions(mockGetPostsUseCase);
    });

    test('Debería retornar un Failure cuando falla la obtención de posts', () async {
      const failure = Failure.data(message: "Error al obtener posts");
      when(mockGetPostsUseCase.getAllPosts()).thenAnswer((_) async => const Left(failure));
      final result = await postPaginator.fetchItems(0, 2);

      expect(result.isLeft(), isTrue);
      expect(result.swap().getOrElse(() => const Failure.data(message: '')), failure);
      verify(mockGetPostsUseCase.getAllPosts()).called(1);
      verifyNoMoreInteractions(mockGetPostsUseCase);
    });

    test('Debería retornar los posts en caché cuando la caché no está vacía', () async {
      final posts = [
        PostResponseModel(userId: 1, id: 1, title: 'Post 1', body: 'Contenido 1', image: ''),
      ];
      postPaginator.cachedPosts = posts;
      final result = await postPaginator.fetchItems(0, 1);

      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => []), posts); 
      verifyNever(mockGetPostsUseCase.getAllPosts());
    });

    test('Debería volver a empezar cuando el startIndex es mayor que el tamaño de la caché', () async {
      final posts = [
        PostResponseModel(userId: 1, id: 1, title: 'Post 1', body: 'Contenido 1', image: ''),
      ];
      postPaginator.cachedPosts = posts;
      final result = await postPaginator.fetchItems(1, 1);

      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => []), posts);
    });

    test('Debería retornar una lista vacía cuando el límite es 0', () async {
      postPaginator.cachedPosts = [
        PostResponseModel(userId: 1, id: 1, title: 'Post 1', body: 'Contenido 1', image: ''),
      ];

      final result = await postPaginator.fetchItems(0, 0);
      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => []), isEmpty);
    });
  });
}
