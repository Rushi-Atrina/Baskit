import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';

import '../../data/local/daos/cart_dao.dart';
import '../../data/local/database.dart';
import '../../data/repositories/cart_repository.dart';
import '../../data/repositories/favourite_repository.dart';
import '../../data/repositories/product_repository.dart';

/// requirements.md §7 — reads a single product reactively from Drift.
class ProductDetailsController extends GetxController {
  ProductDetailsController(
    this._productRepository,
    this._favouriteRepository,
    this._cartRepository,
    this.productId,
  );

  final ProductRepository _productRepository;
  final FavouriteRepository _favouriteRepository;
  final CartRepository _cartRepository;
  final int productId;

  final Rxn<Product> product = Rxn<Product>();
  final isFavourite = false.obs;
  final cartQuantity = 0.obs;
  final carouselIndex = 0.obs;

  StreamSubscription<Product?>? _productSub;
  StreamSubscription<bool>? _favouriteSub;
  StreamSubscription<List<CartLine>>? _cartSub;

  @override
  void onInit() {
    super.onInit();
    _productSub = _productRepository.watchById(productId).listen((p) => product.value = p);
    _favouriteSub =
        _favouriteRepository.watchIsFavourite(productId).listen((v) => isFavourite.value = v);
    _cartSub = _cartRepository.watchCart().listen((lines) {
      for (final line in lines) {
        if (line.product.id == productId) {
          cartQuantity.value = line.quantity;
          return;
        }
      }
      cartQuantity.value = 0;
    });
  }

  List<String> get images {
    final p = product.value;
    if (p == null) return const [];
    try {
      final decoded = (jsonDecode(p.imagesJson) as List).cast<String>();
      return decoded.isNotEmpty ? decoded : [p.thumbnail];
    } catch (_) {
      return [p.thumbnail];
    }
  }

  void toggleFavourite() => _favouriteRepository.toggle(productId);

  void addToCart() => _cartRepository.addOrIncrement(productId);

  @override
  void onClose() {
    _productSub?.cancel();
    _favouriteSub?.cancel();
    _cartSub?.cancel();
    super.onClose();
  }
}
