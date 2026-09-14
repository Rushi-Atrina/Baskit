import 'dart:async';

import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../data/local/database.dart';
import '../../data/repositories/favourite_repository.dart';

/// requirements.md §8 — Favourite Module. Entirely Drift-backed.
class FavouritesController extends GetxController {
  FavouritesController(this._favouriteRepository);

  final FavouriteRepository _favouriteRepository;

  final products = <Product>[].obs;
  StreamSubscription<List<Product>>? _subscription;

  @override
  void onInit() {
    super.onInit();
    _subscription = _favouriteRepository.watchAll().listen(products.assignAll);
  }

  void remove(int productId) => _favouriteRepository.remove(productId);

  void openDetails(Product product) {
    Get.toNamed(Routes.productDetails, arguments: product.id);
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
