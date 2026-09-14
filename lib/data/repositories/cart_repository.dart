import '../local/daos/cart_dao.dart';
import '../local/database.dart';

/// requirements.md §9 (Cart Module) — entirely local, Drift-backed.
/// Subtotal/Discount/Grand Total are computed by the controller from the
/// [CartLine] stream, not stored, so they always match live product data.
class CartRepository {
  CartRepository(this._db);

  final AppDatabase _db;

  Stream<List<CartLine>> watchCart() => _db.cartDao.watchCart();

  Future<void> addOrIncrement(int productId, {int by = 1}) =>
      _db.cartDao.addOrIncrement(productId, by: by);

  Future<void> updateQuantity(int productId, int quantity) =>
      _db.cartDao.updateQuantity(productId, quantity);

  Future<void> remove(int productId) => _db.cartDao.remove(productId);

  Future<void> clear() => _db.cartDao.clear();
}
