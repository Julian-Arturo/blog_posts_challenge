import "package:blog_posts_challenge/core/common/client_http.dart";
import "package:blog_posts_challenge/core/common/models/http_response_model.dart";
import "package:injectable/injectable.dart";

/// Interfaz para la fuente de datos de publicaciones.
/// 
/// Esta interfaz define el contrato para obtener publicaciones 
/// desde un origen de datos.
abstract class PostDataSource {
  Future<HttpResponseModel> getAllPosts();
}


/// Esta clase utiliza un cliente HTTP para recuperar todas las 
/// publicaciones desde un servicio web.
@Injectable(as: PostDataSource)
class PostDataSourceImpl extends PostDataSource {
  final String urlServices = "posts"; 
  final ClientHttp clientHttp; 

  PostDataSourceImpl(this.clientHttp);

  @override
  Future<HttpResponseModel> getAllPosts() {
    return clientHttp.get(
      endpoint: urlServices,
    );
  }
}
