import 'package:blog_posts_challenge/core/util/colors.dart';
import 'package:blog_posts_challenge/core/util/context_dimens.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/bloc/blocs/post_cubit.dart';
import 'package:blog_posts_challenge/feature/blog/presentation/bloc/states/post_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Widget que representa una barra de pestañas para navegar entre diferentes vistas.
class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        final cubit = context.read<PostsCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Pestaña para 'Posts'
            _buildTab(context, 'Posts', state.isPostsTabSelected, () => cubit.toggleTab(true)),
            // Pestaña para 'Otro'
            _buildTab(context, 'Otro', !state.isPostsTabSelected, () => cubit.toggleTab(false)),
          ],
        );
      },
    );
  }

  /// Construye una pestaña individual.
  Widget _buildTab(BuildContext context, String title, bool isSelected, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: context.height(kIsWeb ? 0.03 : 0.05),
              margin: context.bottom(kIsWeb ? 0.01 : 0.02),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? appSecondary : appBackground,
                ),
              ),
            ),
            if (isSelected)
              Container(
                height: 2,
                width: 40,
                color: appSecondary,
              ),
          ],
        ),
      ),
    );
  }
}
