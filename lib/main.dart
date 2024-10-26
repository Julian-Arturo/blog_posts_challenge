import "package:blog_posts_challenge/app.dart";
import "package:blog_posts_challenge/core/util/config.dart";
import "package:blog_posts_challenge/injection/injection.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

// coverage:ignore-start and 
void main() async {
  // Configura la inyección de dependencias
  configureDependencies();  
  // Lanza la aplicación
  runApp(const BlocsProvider());
}
// coverage:ignore-end


/// Esta clase se encarga de contener todos los BlocProvider
class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getBlocProviders(),
      child: const App(),
    );
  }
}
