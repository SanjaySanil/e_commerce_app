import 'package:e_commerce_app/controller/api_service_controller/api_service_controller.dart';
import 'package:e_commerce_app/controller/db_controller/db_controller.dart';
import 'package:e_commerce_app/models/db_model.dart';
import 'package:e_commerce_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DBModelAdapter());
  await Hive.openBox<DBModel>("shopping_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiServiceController(),
        ),
        ChangeNotifierProvider(create: (context) => DBController())
      ],
      child: MaterialApp.router(
        theme: ThemeData.light(),
        themeMode: ThemeMode.light,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
