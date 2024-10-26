import 'package:blog_posts_challenge/core/common/failures/failure.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/domain/use_case/post_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Interfaz genérica para un paginador.
abstract class Paginator<T> {
  Future<Either<Failure, List<T>>> fetchItems(int startIndex, int limit);
}

/// Esta clase gestiona la obtención y la paginación de las publicaciones,
/// almacenando en caché las publicaciones recuperadas para un acceso eficiente.
@Injectable(as: Paginator)
class PostPaginator implements Paginator<PostResponseModel> {
  final GetPostsUseCase getPostsUseCase; 
  List<PostResponseModel> cachedPosts = []; 

  PostPaginator(this.getPostsUseCase);

  /// Recupera las publicaciones comenzando desde `startIndex` y con un 
  /// número máximo definido por `limit`.
  @override
  Future<Either<Failure, List<PostResponseModel>>> fetchItems(int startIndex, int limit) async {
    if (cachedPosts.isEmpty) {
      final Either<Failure, List<PostResponseModel>> result = await getPostsUseCase.getAllPosts();
      if (result.isLeft()) {
        return result;
      } else {
        cachedPosts = result.getOrElse(() => []);
      }
    }

    // Asegúrate de que el startIndex esté dentro de los límites
    startIndex = (startIndex >= cachedPosts.length) ? 0 : startIndex;
    await Future.delayed(const Duration(milliseconds: 200));
    return Right(cachedPosts.skip(startIndex).take(limit).toList());
  }
}
