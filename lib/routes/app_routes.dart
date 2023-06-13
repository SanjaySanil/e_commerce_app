import 'package:e_commerce_app/controller/api_service_controller/api_service_controller.dart';
import 'package:e_commerce_app/views/pages/category_view/category_view.dart';
import 'package:e_commerce_app/views/pages/home_page/home_page.dart';
import 'package:e_commerce_app/views/pages/home_page/widgets/detailed_page/detailed_page.dart';
import 'package:e_commerce_app/views/pages/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static const String detailedView = "/detailedView";
  static const String categoryView = "/categoryView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(path: '/HomePage', builder: (context, state) => HomePage()),
      GoRoute(
        path: "$detailedView/:${"id"}",
        builder: (context, state) => DetailedPage(
          id: state.pathParameters["id"]!,
        ),
      ),
      GoRoute(
        path: "$categoryView/:${"id"}",
        builder: (context, state) =>
            CategoryView(id: state.pathParameters["id"]!),
      ),
    ],
  );
}
