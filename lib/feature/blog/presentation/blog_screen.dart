import 'package:blog_posts_challenge/feature/blog/presentation/widgets/blog_content_page.dart';
import 'package:flutter/material.dart';

/// Pantalla principal del blog.
///
/// Esta pantalla sirve como contenedor para el contenido del blog, 
/// utilizando el widget `BlogContentPage` para mostrar la información.
class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BlogContentPage());
  }
}
