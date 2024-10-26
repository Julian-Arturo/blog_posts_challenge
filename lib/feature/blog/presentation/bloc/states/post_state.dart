import "package:equatable/equatable.dart";
import "package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart";

/// Representa el estado de las publicaciones, incluyendo la lista de publicaciones cargadas,
/// si está cargando alguna acción, si hubo algún error y el estado de la carga.
class PostsState extends Equatable {
  final List<PostResponseModel> posts; // Lista de publicaciones cargadas
  final List<PostResponseModel> paginatedPosts; // Lista de publicaciones segmentadas
  final bool isLoading; // Indica si está cargando publicaciones
  final String? error; // Mensaje de error en caso de que ocurra un fallo
  final bool isPostsTabSelected;  // Indica si el tap esta selecionado
  final bool isRefreshing; // Variable para refrescar la lista 

  const PostsState({
    this.posts = const [],
    this.isLoading = false,
    this.error,
    this.isPostsTabSelected = true,
    this.isRefreshing = false, 
    this.paginatedPosts = const []
  });

  ///Se Crea una nueva instancia de [PostsState] copiando los valores actuales
  /// y permitiendo la modificación de algunos campos.
  PostsState copyWith({
    List<PostResponseModel>? posts,
    bool? isLoading,
    String? error,
    bool? isPostsTabSelected,
    bool? isRefreshing,
    List<PostResponseModel>? paginatedPosts,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isPostsTabSelected: isPostsTabSelected ?? this.isPostsTabSelected,
      isRefreshing: isRefreshing ?? this.isRefreshing, 
      paginatedPosts: paginatedPosts ?? this.paginatedPosts,

    );
  }

  /// Define los campos que serán usados para determinar si dos instancias
  /// de [PostsState] son iguales.
  @override
  List<Object?> get props => [posts, isLoading, error, isPostsTabSelected, isRefreshing, paginatedPosts];
}
