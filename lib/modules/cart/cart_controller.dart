import 'dart:async';

import 'package:get/get.dart';

import '../../data/local/daos/cart_dao.dart';
import '../../data/repositories/cart_repository.dart';

/// requirements.md §9 — Cart Module. Subtotal/Discount/Grand Total are
/// derived, never stored, so they always reflect current product data.
class CartController extends GetxController {
  CartController(this._cartRepository);

  final CartRepository _cartRepository;

  final lines = <CartLine>[].obs;
  StreamSubscription<List<CartLine>>? _subscription;

  @override
  void onInit() {
    super.onInit();
    _subscription = _cartRepository.watchCart().listen(lines.assignAll);
  }

  int get itemCount => lines.fold(0, (sum, l) => sum + l.quantity);

  double get subtotal =>
      lines.fold(0, (sum, l) => sum + l.product.price * l.quantity);

  double get discount => lines.fold(
        0,
        (sum, l) =>
            sum + l.product.price * l.quantity * (l.product.discountPercentage / 100),
      );

  double get grandTotal => subtotal - discount;

  void increment(int productId) => _cartRepository.addOrIncrement(productId);

  void decrement(int productId, int currentQuantity) =>
      _cartRepository.updateQuantity(productId, currentQuantity - 1);

  void remove(int productId) => _cartRepository.remove(productId);

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
