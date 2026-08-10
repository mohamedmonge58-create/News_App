import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/modules/splash/presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashPage(),
    );
  }
}


