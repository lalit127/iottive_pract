import 'package:go_router/go_router.dart';
import 'package:iottive_pract/models/order_model.dart';
import 'package:iottive_pract/screens/auth/login_screen.dart';
import 'package:iottive_pract/screens/home/home_screen.dart';
import 'package:iottive_pract/screens/product/product_detail_screen.dart';
import 'package:iottive_pract/screens/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String productDetail = '/product_detail';
}

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    GoRoute(
      path: Routes.productDetail,
      builder: (context, state) {
        final product = state.extra as ProductModel;
        return ProductDetailScreen(product: product);
      },
    ),
  ],
);
