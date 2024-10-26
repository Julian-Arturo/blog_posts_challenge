import 'package:blog_posts_challenge/core/util/animations_paths.dart'; 
import 'package:blog_posts_challenge/core/util/colors.dart';
import 'package:blog_posts_challenge/core/util/images_paths.dart';
import 'package:blog_posts_challenge/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart';

/// Pantalla de inicio que muestra una animación o imagen de carga.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const int _splashDuration = 5; 

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  /// Navega a la siguiente pantalla después de un retraso.
  void _navigateToNextScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: _splashDuration), () {
        if (mounted) {
          context.go(Routes.blog);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      body: SizedBox.expand(
        child: _buildSplashContent(),
      ),
    );
  }

  /// Devuelve el contenido de la pantalla de inicio.
  Widget _buildSplashContent() {
    if (kReleaseMode) {
      return Lottie.asset(
        animationsPaths.splash,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        imagesPaths.logo,
        fit: BoxFit.cover,
      );
    }
  }
}
