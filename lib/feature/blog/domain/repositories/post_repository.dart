import "package:blog_posts_challenge/core/common/failures/failure.dart";
import "package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart";
import "package:dartz/dartz.dart";

/// Interfaz para el repositorio de publicaciones, que define métodos para obtener publicaciones.
abstract class PostRepository {
  Future<Either<Failure, List<PostResponseModel>>> getAllPosts();
}

