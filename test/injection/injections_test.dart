import 'package:blog_posts_challenge/feature/blog/presentation/bloc/blocs/post_cubit.dart';
import 'package:blog_posts_challenge/injection/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  setUpAll(() {
    configureDependencies();
  });

  tearDownAll(() {
    GetIt.instance.reset();
  });

  test('Debería registrar PostsCubit en el contenedor de GetIt', () {
    expect(GetIt.I.isRegistered<PostsCubit>(), isTrue);
  });

  test('Debería proporcionar una instancia de PostsCubit', () {
    final cubit = GetIt.I<PostsCubit>();
    expect(cubit, isA<PostsCubit>());
  });
}
