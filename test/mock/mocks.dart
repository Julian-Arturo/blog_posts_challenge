import 'package:blog_posts_challenge/core/common/failures/failure.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/data/repositories/paginator_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';


class MockPaginator extends Mock implements Paginator<PostResponseModel> {
  @override
  Future<Either<Failure, List<PostResponseModel>>> fetchItems(int startIndex, int limit) {
    final post1 = PostResponseModel(
        id: 1,
        title: 'Post 1',
        body: 'Content 1',
        userId: 1,
        image: 'assets/images/portada.jpg');
    final post2 = PostResponseModel(
        id: 2,
        title: 'Post 2',
        body: 'Content 2',
        userId: 1,
        image: 'assets/images/portada.jpg');

    final listPost = [
      post1,
      post2,
    ];

    return Future.value(Right(listPost));
  }
}



