// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/common/client_http.dart' as _i117;
import '../feature/blog/data/data_source/post_data_source.dart' as _i1012;
import '../feature/blog/data/model/post_response_model.dart' as _i568;
import '../feature/blog/data/repositories/paginator_impl.dart' as _i739;
import '../feature/blog/data/repositories/post_repository_impl.dart' as _i158;
import '../feature/blog/domain/repositories/post_repository.dart' as _i773;
import '../feature/blog/domain/use_case/post_use_case.dart' as _i418;
import '../feature/blog/presentation/bloc/blocs/post_cubit.dart' as _i693;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i117.ClientHttp>(() => _i117.ClientHttp());
    gh.factory<_i1012.PostDataSource>(
        () => _i1012.PostDataSourceImpl(gh<_i117.ClientHttp>()));
    gh.factory<_i773.PostRepository>(
        () => _i158.PostRepositoryImpl(gh<_i1012.PostDataSource>()));
    gh.factory<_i418.GetPostsUseCase>(
        () => _i418.GetPostsUseCase(gh<_i773.PostRepository>()));
    gh.factory<_i739.Paginator<_i568.PostResponseModel>>(
        () => _i739.PostPaginator(gh<_i418.GetPostsUseCase>()));
    gh.factory<_i693.PostsCubit>(
        () => _i693.PostsCubit(gh<_i739.Paginator<_i568.PostResponseModel>>()));
    return this;
  }
}
