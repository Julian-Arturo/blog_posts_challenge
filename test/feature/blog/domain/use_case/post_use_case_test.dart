import 'package:blog_posts_challenge/core/common/failures/failure.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/domain/repositories/post_repository.dart';
import 'package:blog_posts_challenge/feature/blog/domain/use_case/post_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'post_use_case_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<PostRepository>(as: #MockPostRepository)])
final List<PostResponseModel> posts = [
  PostResponseModel(
    id: 1,
    title: 'Post 1',
    body: 'Content 1',
    userId: 1,
    image: 'assets/images/portada.jpg',
  ),
  PostResponseModel(
    id: 2,
    title: 'Post 2',
    body: 'Content 2',
    userId: 2,
    image: 'assets/images/portada.jpg',
  ),
];

void main() {
  var mockPostRepository = MockPostRepository();
  late GetPostsUseCase getPostsUseCase;

  setUp(() {
    getPostsUseCase = GetPostsUseCase(mockPostRepository);
  });

  group('GetPostsUseCase', () {
    test('Debería retornar una lista de publicaciones cuando los datos se obtienen con éxito',
        () async {
      when(mockPostRepository.getAllPosts()).thenAnswer((_) async => Right(posts));
      final result = await getPostsUseCase.getAllPosts();

      expect(result, Right(posts));
      verify(mockPostRepository.getAllPosts()).called(1);
      verifyNoMoreInteractions(mockPostRepository);
    });

    test('Debería manejar un error cuando la recuperación de datos falla',
        () async {
      const failure = Failure.data(message: "Error en la red");
      when(mockPostRepository.getAllPosts()).thenAnswer((_) async => const Left(failure));

      final result = await getPostsUseCase.getAllPosts();

      expect(result, const Left(failure));
      verify(mockPostRepository.getAllPosts()).called(1);
      verifyNoMoreInteractions(mockPostRepository);
    });

    test('Debería manejar correctamente una lista vacía de publicaciones',
        () async {
      when(mockPostRepository.getAllPosts()).thenAnswer((_) async => const Right(<PostResponseModel>[]));
      final result = await getPostsUseCase.getAllPosts();

      expect(result, const Right(<PostResponseModel>[])); 
      verify(mockPostRepository.getAllPosts()).called(1);
      verifyNoMoreInteractions(mockPostRepository);
    });

    test(
      'Debería manejar una excepción inesperada al intentar obtener publicaciones',
      () async {
        const failure = Failure.data(message: "Error inesperado");
        when(mockPostRepository.getAllPosts()).thenAnswer((_) async => const Left(failure));
        final result = await getPostsUseCase.getAllPosts();

        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
        verify(mockPostRepository.getAllPosts()).called(1);
        verifyNoMoreInteractions(mockPostRepository);
      },
    );
  });
}
