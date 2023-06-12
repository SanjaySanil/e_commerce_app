import 'package:e_commerce_app/controller/splash_screen_controller/splash_screen_controller.dart';
import 'package:e_commerce_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenController(),
        ),
      ],
      child: MaterialApp.router(
        theme:ThemeData.light(),
        themeMode:ThemeMode.light,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
