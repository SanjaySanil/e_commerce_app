import 'package:e_commerce_app/controller/splash_screen_controller/splash_screen_controller.dart';
import 'package:e_commerce_app/views/pages/home_page/home_page.dart';
import 'package:e_commerce_app/views/pages/home_page/widgets/detailed_page/detailed_page.dart';
import 'package:e_commerce_app/views/pages/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static const String detailedView="/detailedView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            Provider.of<SplashScreenController>(context).onLoading
                ? HomePage()
                : SplashScreen(),
      ),
      GoRoute(
        path:detailedView,
        builder: (context, state) => DetailedPage(),
      ),
    ],
  );
}
