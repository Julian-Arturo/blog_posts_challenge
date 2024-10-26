import 'package:flutter_test/flutter_test.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/data/repositories/paginator_impl.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/bloc/states/post_state.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/bloc/blocs/post_cubit.dart';
import '../../../../../mock/mocks.dart';

void main() {
  late Paginator<PostResponseModel> mockPaginator;
  late PostsCubit postsCubit;
  final PostResponseModel post1 = PostResponseModel(
    id: 1,
    title: 'Post 1',
    body: 'Content 1',
    userId: 1,
    image: 'assets/images/portada.jpg',
  );
  final PostResponseModel post2 = PostResponseModel(
    id: 2,
    title: 'Post 2',
    body: 'Content 2',
    userId: 1,
    image: 'assets/images/portada.jpg',
  );

  final List<PostResponseModel> listPost = [post1, post2];

  setUp(() {
    mockPaginator = MockPaginator();
    postsCubit = PostsCubit(mockPaginator);
  });

  tearDown(() {
    postsCubit.close();
  });

  group('Tests de White-Box para PostsCubit', () {
    test('el estado inicial es PostsState()', () {
      expect(postsCubit.state, const PostsState());
    });

    test('Debería restablecer la paginación correctamente', () async {
      await postsCubit.paginatePosts(reset: false);
      expect(postsCubit.hasMorePosts, false);
      expect(postsCubit.currentStartIndex, listPost.length);
    });

    test('Debería agregar nuevas publicaciones correctamente', () async {
      await postsCubit.paginatePosts();
      expect(postsCubit.paginatedPosts.length, listPost.length);
      expect(postsCubit.currentStartIndex, listPost.length);
    });

    test('Debería verificar si hay más publicaciones disponibles', () {
      postsCubit.checkIfMorePostsAvailable([post1]);
      expect(postsCubit.hasMorePosts, false);
    });

    test('Debería manejar correctamente la falta de más publicaciones', () {
      postsCubit.handleNoMorePosts();
      expect(postsCubit.hasMorePosts, false);
      expect(postsCubit.state.error, "No hay publicaciones disponibles.");
    });

    test('Debería manejar el error correctamente', () {
      const errorMessage = "Este es un error de prueba.";
      postsCubit.handleError(errorMessage);
      expect(postsCubit.state.error, errorMessage);
    });

    test('Debería alternar la selección de pestañas correctamente', () {
      expect(postsCubit.state.isPostsTabSelected, true);
      postsCubit.toggleTab(false);
      expect(postsCubit.state.isPostsTabSelected, false);
      postsCubit.toggleTab(true);
      expect(postsCubit.state.isPostsTabSelected, true);
    });

    test('Debería manejar nuevas publicaciones correctamente cuando se reciben nuevas publicaciones',
        () async {
      postsCubit.handleNewPosts(listPost, false);
      expect(postsCubit.state.paginatedPosts, listPost);
      expect(postsCubit.state.isLoading, false);
    });

    test('Debería manejar correctamente la falta de más publicaciones',
        () async {
      postsCubit.handleNewPosts([], false);
      expect(postsCubit.state.error, "No hay publicaciones disponibles.");
    });

    test('Debería emitir el estado de carga', () {
      expect(postsCubit.state.isLoading, false);
      postsCubit.emitLoadingState();
      expect(postsCubit.state.isLoading, true);
    });
  });
}
