import 'dart:async';
import 'package:blog_posts_challenge/feature/blog/data/repositories/paginator_impl.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/bloc/states/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';

/// Cubit que gestiona el estado de las publicaciones en el blog.
///
/// Esta clase se encarga de la paginación de las publicaciones,
/// manejo de errores y la interacción con la interfaz de usuario
/// a través de la emisión de diferentes estados.
@injectable
class PostsCubit extends Cubit<PostsState> {
  
  final Paginator<PostResponseModel> paginator;
  final List<PostResponseModel> paginatedPosts = [];
  int currentStartIndex = 0;
  static const int _limit = 10;
  bool hasMorePosts = true;

  PostsCubit(this.paginator) : super(const PostsState());

  /// Método para paginar publicaciones.
  Future<void> paginatePosts({bool reset = false}) async {
    if (_isPaginationInProgress() || !hasMorePosts) return;
    if (reset) _resetPagination();
    emit(state.copyWith(isLoading: true));
    final result = await paginator.fetchItems(currentStartIndex, _limit);
    result.fold(
      (failure) => handleError(failure.message), 
      (newPosts) => handleNewPosts(newPosts, reset),
    );
  }

  /// Se valida si la paginación está en progreso.
  bool _isPaginationInProgress() => state.isLoading;

  /// Se emite el estado de carga.
  void emitLoadingState() {
    emit(state.copyWith(isLoading: true));
  }

  /// Reinicia la paginación.
  void _resetPagination() {
    currentStartIndex = 0;
    paginatedPosts.clear();
    hasMorePosts = true;
  }

  /// Se maneja las nuevas publicaciones recibidas.
  void handleNewPosts(List<PostResponseModel> newPosts, bool reset) {
    if (newPosts.isEmpty) {
      handleNoMorePosts();
    } else {
      addNewPosts(newPosts);
      emit(state.copyWith(isLoading: false, paginatedPosts: List.from(paginatedPosts)));
      checkIfMorePostsAvailable(newPosts);
    }
  }

  /// Se ejecuta cuando no hay post
  void handleNoMorePosts() {
    hasMorePosts = false;
    handleError("No hay publicaciones disponibles.");
  }

  void handleError(String error) {
    emit(state.copyWith(isLoading: false, error: error.toString()));
  }

  /// Esta Agrega nuevas publicaciones a la lista paginada.
  void addNewPosts(List<PostResponseModel> newPosts) {
    paginatedPosts.addAll(newPosts);
    currentStartIndex += newPosts.length;
  }

  ///Se verifica si hay más publicaciones disponibles.
  void checkIfMorePostsAvailable(List<PostResponseModel> newPosts) {
    if (newPosts.length < _limit) {
      hasMorePosts = false;
    }
  }

  /// Alterna entre las pestañas de publicaciones.
  void toggleTab(bool isPostsTabSelected) {
    emit(state.copyWith(isPostsTabSelected: isPostsTabSelected));
  }
}
