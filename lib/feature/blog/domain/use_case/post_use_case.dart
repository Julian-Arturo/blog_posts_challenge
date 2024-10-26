import 'package:blog_posts_challenge/core/common/failures/failure.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// La clase `GetPostsUseCase` recupera publicaciones de un `PostRepository`.
/// 
/// Esta clase encapsula la lógica para obtener todas las publicaciones 
/// desde el repositorio, gestionando posibles fallos en la recuperación.
@injectable
class GetPostsUseCase {
  final PostRepository repository; 
  GetPostsUseCase(this.repository);

  /// Retorna un `Either` que puede contener un `Failure` en caso de error
  /// o una lista de `PostResponseModel` si la recuperación es exitosa.
  Future<Either<Failure, List<PostResponseModel>>> getAllPosts() async {
    return await repository.getAllPosts(); 
  }
}
