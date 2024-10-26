import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:blog_posts_challenge/feature/blog/data/repositories/paginator_impl.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/bloc/blocs/post_cubit.dart';
import 'package:get_it/get_it.dart';
import '../mock/mocks.dart';


void configureTestDependencies(GetIt sl) {
  // Registra el mock de Paginator<PostResponseModel>
  sl.registerFactory<Paginator<PostResponseModel>>(() => MockPaginator());

  // Registra tus dependencias específicas para pruebas aquí
  sl.registerFactory<PostsCubit>(() => PostsCubit(sl<Paginator<PostResponseModel>>())); 
}
