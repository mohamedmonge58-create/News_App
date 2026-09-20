import 'package:flutter/material.dart';
import 'package:news/core/routes/app_router.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:provider/provider.dart';

import 'core/providerrr/settings.dart' show Settings;
import 'core/theme/app_theme_manager.dart';
import 'modules/home/view_model/home_view_model.dart';
import 'modules/search/view_model/search_view_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Settings()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => SearchViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
      navigatorKey: navigatorKey,
      themeMode: settings.currentThemeMode,
      theme: AppThemeManager.getLightTheme(),
      darkTheme: AppThemeManager.getDarkTheme(),
    );
  }
}