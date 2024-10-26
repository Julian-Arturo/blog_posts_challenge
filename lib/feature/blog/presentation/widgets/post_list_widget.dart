import 'package:blog_posts_challenge/core/util/collections/random_selector.dart';
import 'package:blog_posts_challenge/core/util/colors.dart';
import 'package:blog_posts_challenge/core/util/context_dimens.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/widgets/post_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';

/// Widget que muestra una lista de publicaciones con un diseño específico.
///
/// Se utiliza un `PostResponseModel` para obtener los datos de la publicación
/// y selecciona un color aleatorio para personalizar la apariencia del widget.
class PostListWidget extends StatefulWidget {
  final PostResponseModel posts;

  const PostListWidget({super.key, required this.posts});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  late final Color color;

  @override
  void initState() {
    super.initState();
    // Selecciona un color aleatorio.
    final randomColorSelector = RandomSelector<Color>(colorPalette); 
    color = randomColorSelector.getRandomElement()  ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: kIsWeb ? context.adjustedSize(450) : null, 
        margin: context.all(kIsWeb ? 0.01 : 0.03),
        decoration: BoxDecoration(
          border: Border.all(color: appOnBorder),
          color: appSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            _buildHeader(),
            PostCard(
              color: color, 
              image: widget.posts.image,
              title: widget.posts.title,
            ),
          ],
        ),
      ),
    );
  }

  /// Crea el encabezado del widget de publicaciones.
  Widget _buildHeader() {
    return Padding(
      padding: context.all(kIsWeb ? 0.02 : 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCommunityLabel(), // Etiqueta de comunidad.
          _buildTitle(), // Título de la publicación.
          const SizedBox(height: 10),
          _buildBody(), // Cuerpo de la publicación.
          const SizedBox(height: 20),
          _buildReadMoreButton(), // Botón de "Leer más".
        ],
      ),
    );
  }

  /// Se Crea la etiqueta de la comunidad en la parte superior.
  Widget _buildCommunityLabel() {
    return Container(
      padding: context.symmetric(kIsWeb ? 0.01 : 0.02, kIsWeb ? 0.003 : 0.01),
      margin: context.bottom(kIsWeb ? 0.02 : 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color, 
      ),
      child: const Text(
        "Community",
        style: TextStyle(color: appOnPrimary),
      ),
    );
  }

  /// Se Crea el título de la publicación.
  Widget _buildTitle() {
    return Text(
      widget.posts.title,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: appOnSurface,
        height: 1,
      ),
    );
  }

  /// Se Crea el cuerpo de la publicación.
  Widget _buildBody() {
    return Text(
      widget.posts.body,
      style: const TextStyle(color: appOnSurface, fontSize: 16),
    );
  }

  /// Se Crea un botón para leer más sobre la publicación.
  Widget _buildReadMoreButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click, 
      child: SizedBox(
        width: kIsWeb ? context.adjustedSize(180) : context.width(0.35), 
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Read more',
              style: TextStyle(
                color: color, // Color del texto.
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.arrow_forward_rounded,
              size: 15,
              color: color, // Color del icono.
            ),
          ],
        ),
      ),
    );
  }
}
