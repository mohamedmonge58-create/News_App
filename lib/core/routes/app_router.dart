import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/modules/home/pages/home_view.dart';
import 'package:news/modules/splash/presentation/pages/splash_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
}