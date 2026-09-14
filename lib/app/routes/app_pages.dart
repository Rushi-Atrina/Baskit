import 'package:get/get.dart';

import '../../modules/auth/auth_binding.dart';
import '../../modules/auth/auth_view.dart';
import '../../modules/splash/splash_binding.dart';
import '../../modules/splash/splash_view.dart';
import '../../modules/sync/sync_binding.dart';
import '../../modules/sync/sync_view.dart';
import '../../shared/widgets/placeholder_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = <GetPage>[
    GetPage(name: Routes.splash, page: () => const SplashView(), binding: SplashBinding()),
    GetPage(name: Routes.auth, page: () => const AuthView(), binding: AuthBinding()),

    GetPage(name: Routes.sync, page: () => const SyncView(), binding: SyncBinding()),

    // Placeholders — replaced as each phase in docs/plan.md lands.
    GetPage(name: Routes.dashboard, page: () => const PlaceholderView(title: 'Dashboard')),
    GetPage(name: Routes.categories, page: () => const PlaceholderView(title: 'Categories')),
    GetPage(name: Routes.products, page: () => const PlaceholderView(title: 'Products')),
    GetPage(
      name: Routes.productDetails,
      page: () => const PlaceholderView(title: 'Product Details'),
    ),
    GetPage(name: Routes.favourites, page: () => const PlaceholderView(title: 'Favourites')),
    GetPage(name: Routes.cart, page: () => const PlaceholderView(title: 'Cart')),
  ];
}
