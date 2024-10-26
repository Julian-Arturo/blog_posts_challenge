import "package:blog_posts_challenge/injection/injection.config.dart";
import "package:get_it/get_it.dart";
import "package:injectable/injectable.dart";

/// Instancia global del contenedor de inyección de dependencias.
final getIt = GetIt.instance;  

/// Inicializa la configuración de inyección de dependencias.
///
/// Registra las dependencias en el contenedor `getIt`.
@InjectableInit(  
  initializerName: "init",  
  preferRelativeImports: true, 
  asExtension: true, 
)  
void configureDependencies() => getIt.init();
