import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iottive_pract/gen/assets.gen.dart';
import 'package:iottive_pract/utils/app_preference.dart';
import 'package:iottive_pract/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoginStatus(context);
    });
  }

  checkLoginStatus(BuildContext ctx) async {
    final accessToken = await AppPreference().getStringFromSF('access_token');
    if (accessToken != null) {
      ctx.go(Routes.home);
    } else {
      ctx.go(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.images.shoppingBg.path, fit: BoxFit.cover),
      ),
    );
  }
}
