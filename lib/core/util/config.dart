import "package:blog_posts_challenge/feature/blog/presentation/bloc/blocs/post_cubit.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";


/// Proporciona una lista de [BlocProvider] para la aplicación.
/// Esta función retorna una lista de instancias de [BlocProvider]
/// que proporcionan diversos [Cubit]s y [Bloc]s al árbol de widgets.
List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<PostsCubit>(create: (context) => GetIt.instance<PostsCubit>()),
  ];
}


