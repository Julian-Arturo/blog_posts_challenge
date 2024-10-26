import 'dart:convert';
import 'package:blog_posts_challenge/core/common/failures/failure.dart';
import 'package:blog_posts_challenge/core/common/models/http_response_model.dart';
import 'package:blog_posts_challenge/core/util/collections/random_selector.dart';
import 'package:blog_posts_challenge/core/util/images_paths.dart';
import 'package:blog_posts_challenge/core/util/utils.dart';
import 'package:blog_posts_challenge/feature/blog/data/data_source/post_data_source.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

/// Implementación del repositorio de publicaciones.
/// 
/// Esta clase se encarga de interactuar con la fuente de datos 
/// para recuperar las publicaciones y gestionar errores relacionados.
@Injectable(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostDataSource dataSource; // Fuente de datos para obtener las publicaciones.

  PostRepositoryImpl(this.dataSource);

  /// Este retorna un `Either` que contiene un `Failure` en caso de error
  /// o una lista de `PostResponseModel` si la operación es exitosa.
  @override
  Future<Either<Failure, List<PostResponseModel>>> getAllPosts() async {
    try {
      final HttpResponseModel result = await dataSource.getAllPosts();
        if (result.message != null) {
        return left(Failure.data(message: result.message ?? "serviceError"));
      }    
      List<dynamic> postsJson = jsonDecode(result.body ?? "[]");
      final randomSelector = RandomSelector<String>(imagesPaths.postImages);

      final List<PostResponseModel> allPosts = postsJson.map((post) {
        String image = randomSelector.getRandomElement() ?? "assets/images/post-1.jpg"; 
        return PostResponseModel(
          userId: post['userId'],
          id: post['id'],
          title: cleanText(post['title'] as String), 
          body: cleanText(post['body'] as String),  
          image: image,                           
        );
      }).toList();

      return right(allPosts); 
    } catch (error) {
      return left(Failure.data(message: '$error')); 
    }
  }
}
