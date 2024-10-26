/// Clase que contiene las rutas de los archivos de imagen utilizados en la aplicación.
/// 
/// La clase `ImagesPaths` centraliza las rutas de los archivos de imagen, 
/// facilitando su gestión y reutilización en toda la aplicación.
class ImagesPaths {

  String portada = "assets/images/portada.jpg";
  String logo = "assets/images/logo.png";


  /// Estas imágenes se utilizan para representar cada post en la aplicación.
  List<String> postImages = [
    "assets/images/post-1.jpg",
    "assets/images/post-2.jpg",
    "assets/images/post-3.jpg",
    "assets/images/post-4.jpg",
    "assets/images/post-5.jpg",
    "assets/images/post-6.jpg",
    "assets/images/post-7.jpg",
  ];
}

/// Instancia única de `ImagesPaths` que se utiliza para acceder a las rutas de las imágenes.
/// 
/// Esta instancia se puede utilizar en toda la aplicación para obtener las rutas a los archivos de imagen.
final ImagesPaths imagesPaths = ImagesPaths();
