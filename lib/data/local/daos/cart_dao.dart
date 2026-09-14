import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/cart_table.dart';
import '../tables/products_table.dart';

part 'cart_dao.g.dart';

/// A cart row joined with its product, ready for the Cart screen /
/// subtotal-discount-grand total calculations (requirements.md §9).
class CartLine {
  final Product product;
  final int quantity;

  const CartLine({required this.product, required this.quantity});
}

@DriftAccessor(tables: [CartItems, Products])
class CartDao extends DatabaseAccessor<AppDatabase> with _$CartDaoMixin {
  CartDao(super.attachedDatabase);

  Stream<List<CartLine>> watchCart() {
    final query = select(cartItems).join([
      innerJoin(products, products.id.equalsExp(cartItems.productId)),
    ])..orderBy([OrderingTerm.desc(cartItems.addedAt)]);

    return query.watch().map(
          (rows) => rows
              .map(
                (row) => CartLine(
                  product: row.readTable(products),
                  quantity: row.readTable(cartItems).quantity,
                ),
              )
              .toList(),
        );
  }

  Future<void> addOrIncrement(int productId, {int by = 1}) async {
    final existing = await (select(cartItems)
          ..where((t) => t.productId.equals(productId)))
        .getSingleOrNull();

    if (existing == null) {
      await into(cartItems).insert(
        CartItemsCompanion.insert(
          productId: Value(productId),
          quantity: Value(by),
          addedAt: DateTime.now(),
        ),
      );
    } else {
      await updateQuantity(productId, existing.quantity + by);
    }
  }

  Future<void> updateQuantity(int productId, int quantity) {
    if (quantity <= 0) return remove(productId);
    return (update(cartItems)..where((t) => t.productId.equals(productId)))
        .write(CartItemsCompanion(quantity: Value(quantity)));
  }

  Future<void> remove(int productId) {
    return (delete(cartItems)..where((t) => t.productId.equals(productId)))
        .go();
  }

  Future<void> clear() => delete(cartItems).go();
}
