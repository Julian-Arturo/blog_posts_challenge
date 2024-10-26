/// Clase que contiene las rutas de los archivos SVG utilizados en la aplicación.
///
/// La clase `SvgPaths` centraliza las rutas de los archivos SVG, 
/// facilitando su gestión y reutilización en toda la aplicación.
class SvgPaths {
  /// Ruta al archivo SVG del logotipo del blog.
  final String imageBlogs = "assets/svg/svg_blog_logo.svg";
}

/// Instancia única de `SvgPaths` que se utiliza para acceder a las rutas de los archivos SVG.
/// Esta instancia puede ser utilizada en toda la aplicación para obtener las rutas a los archivos SVG.
final SvgPaths svgPaths = SvgPaths();
