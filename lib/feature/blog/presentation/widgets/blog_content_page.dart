import 'package:blog_posts_challenge/core/common/error_handler.dart';
import 'package:blog_posts_challenge/core/util/colors.dart';
import 'package:blog_posts_challenge/core/util/dialogs_extension.dart';
import 'package:blog_posts_challenge/core/util/images_paths.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/bloc/blocs/post_cubit.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/bloc/states/post_state.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/widgets/post_list_widget.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Página principal del contenido del blog que muestra una lista de publicaciones.
class BlogContentPage extends StatefulWidget {
  const BlogContentPage({super.key});

  @override
  BlogContentState createState() => BlogContentState();
}

class BlogContentState extends State<BlogContentPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadInitialPosts());
  }

  /// Carga las publicaciones iniciales.
  Future<void> _loadInitialPosts() async {
    await context.read<PostsCubit>().paginatePosts(reset: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsCubit, PostsState>(
      listener: (context, state) {
        if (state.isLoading) {
          context.showLoadingDialog();
        } else {
          context.hideLoadingDialog();
        }
        if (state.error != null) {
           ErrorHandler.handleErrorView(context, state.error ?? "");
        }
      },
      child: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (_isBottom(scrollInfo) && !state.isLoading) {
                context.read<PostsCubit>().paginatePosts();
              }
              return false;
            },
            child: RefreshIndicator(
              onRefresh: () => context.read<PostsCubit>().paginatePosts(reset: true),
              child: CustomScrollView(
                slivers: [
                  _buildSliverAppBar(),
                  _buildContent(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Verifica si se ha llegado al final de la lista.
  bool _isBottom(ScrollNotification scrollInfo) {
    return scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent;
  }

  /// Construye el SliverAppBar para la página.
  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      backgroundColor: appPrimaryBase,
      flexibleSpace: _buildFlexibleSpace(),
      bottom: const PreferredSize(preferredSize: Size.fromHeight(0), child: TabBarWidget()),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    );
  }

  /// Construye el espacio flexible para el SliverAppBar.
  Widget _buildFlexibleSpace() {
    return FlexibleSpaceBar(
      centerTitle: true,
      background: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackgroundImage(),
          _buildTitle(),
        ],
      ),
    );
  }

  /// Construye la imagen de fondo para el SliverAppBar.
  Widget _buildBackgroundImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
        child: Image.asset(imagesPaths.portada, fit: BoxFit.cover),
      ),
    );
  }

  /// Construye el título en el SliverAppBar.
  Widget _buildTitle() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Blog', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 10),
          Text("El conocimiento es poder", style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }

  /// Construye el contenido principal de la página.
  Widget _buildContent(PostsState state) {
    if (state.isLoading && state.paginatedPosts.isEmpty) {
      return _buildLoadingState();
    } else if (!state.isPostsTabSelected) {
      return _buildNoContentState();
    } else {
      return _buildPostsList(state);
    }
  }

  /// Estado de carga para mostrar mientras se obtienen publicaciones.
  SliverFillRemaining _buildLoadingState() {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: SizedBox.shrink(),
    );
  }

  /// Construye la lista de publicaciones.
  SliverList _buildPostsList(PostsState state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return index < state.paginatedPosts.length
              ? PostListWidget(posts: state.paginatedPosts[index])
              : const SizedBox.shrink();
        },
        childCount: state.paginatedPosts.length + (state.isLoading ? 1 : 0),
      ),
    );
  }

  /// Estado sin contenido para mostrar cuando no hay publicaciones.
  SliverFillRemaining _buildNoContentState() {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text("No hay contenido para mostrar", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
