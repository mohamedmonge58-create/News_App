import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/modules/home/views/home_view.dart';
import 'package:news/modules/splash/presentation/pages/splash_page.dart';
import 'package:provider/provider.dart';

import '../../modules/home/view_model/home_view_model.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) =>  ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
            child:  HomeView()

        ));
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