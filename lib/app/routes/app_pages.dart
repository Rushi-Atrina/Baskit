import 'package:get/get.dart';

import '../../modules/auth/auth_binding.dart';
import '../../modules/auth/auth_view.dart';
import '../../modules/cart/cart_binding.dart';
import '../../modules/cart/cart_view.dart';
import '../../modules/categories/categories_binding.dart';
import '../../modules/categories/categories_view.dart';
import '../../modules/dashboard/dashboard_binding.dart';
import '../../modules/dashboard/dashboard_view.dart';
import '../../modules/favourites/favourites_binding.dart';
import '../../modules/favourites/favourites_view.dart';
import '../../modules/product_details/product_details_binding.dart';
import '../../modules/product_details/product_details_view.dart';
import '../../modules/products/products_binding.dart';
import '../../modules/products/products_view.dart';
import '../../modules/splash/splash_binding.dart';
import '../../modules/splash/splash_view.dart';
import '../../modules/sync/sync_binding.dart';
import '../../modules/sync/sync_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = <GetPage>[
    GetPage(name: Routes.splash, page: () => const SplashView(), binding: SplashBinding()),
    GetPage(name: Routes.auth, page: () => const AuthView(), binding: AuthBinding()),

    GetPage(name: Routes.sync, page: () => const SyncView(), binding: SyncBinding()),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: Routes.categories,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: Routes.products,
      page: () => const ProductsView(),
      binding: ProductsBinding(),
    ),

    GetPage(
      name: Routes.productDetails,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: Routes.favourites,
      page: () => const FavouritesView(),
      binding: FavouritesBinding(),
    ),
    GetPage(name: Routes.cart, page: () => const CartView(), binding: CartBinding()),
  ];
}
