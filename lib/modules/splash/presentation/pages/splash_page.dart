import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/core/theme/app_assets.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(
       Duration(seconds: 3),
          () {
        navigatorKey.currentState!.pushNamedAndRemoveUntil(AppRoutes.home , (route) => false);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Image.asset(AppAssets.logoWhite) )),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text("Supervised by Mohamed Monge",style: TextStyle(color : AppColors.mainText ,fontSize: 14, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
