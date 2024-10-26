import 'package:blog_posts_challenge/core/util/context_dimens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Widget que representa una tarjeta de publicación con una imagen y un título.
///
/// Este widget utiliza una imagen local y permite personalizar el color
/// de fondo de la tarjeta.
class PostCard extends StatelessWidget {
  final String image; 
  final String title;
  final Color color;

  const PostCard({
    super.key,
    required this.image,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: kIsWeb ? context.adjustedSize(150) : context.height(.15), 
      padding: context.all(kIsWeb ? .005 : .02), 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), 
        color: color, 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, 
        children: [
          // Construye el widget de imagen.
          _buildImage(context), 
           // Construye el widget del título.
          _buildTitle(),
        ],
      ),
    );
  }

  /// Se crea un widget de imagen con bordes redondeados.
  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        image, 
        fit: BoxFit.contain, 
        height: kIsWeb ? context.adjustedSize(150) : context.height(.15), 
      ),
    );
  }

  /// Se crea el widget del título de la publicación.
  Widget _buildTitle() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Text(
          title, 
          textAlign: TextAlign.center, 
          style: const TextStyle(
            color: Colors.white, 
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
