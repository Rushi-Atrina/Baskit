import 'package:baskit/data/local/database.dart';
import 'package:baskit/data/repositories/cart_repository.dart';
import 'package:baskit/modules/cart/cart_controller.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late CartController controller;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await db.categoryDao.replaceAll([
      CategoriesCompanion.insert(slug: 'beauty', name: 'Beauty'),
    ]);
    await db.productDao.replaceAll([
      ProductsCompanion.insert(
        id: const Value(1),
        title: 'A',
        description: 'd',
        category: 'beauty',
        price: 100,
        discountPercentage: const Value(10), // 10% off
        thumbnail: 't',
      ),
      ProductsCompanion.insert(
        id: const Value(2),
        title: 'B',
        description: 'd',
        category: 'beauty',
        price: 50,
        thumbnail: 't',
      ),
    ]);
    await db.cartDao.addOrIncrement(1, by: 2); // 2 x $100, 10% off
    await db.cartDao.addOrIncrement(2); // 1 x $50, no discount

    controller = CartController(CartRepository(db));
    controller.onInit();
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);
  });

  tearDown(() {
    controller.onClose();
    return db.close();
  });

  test('computes item count, subtotal, discount, grand total', () {
    expect(controller.itemCount, 3);
    expect(controller.subtotal, 250); // 2*100 + 1*50
    expect(controller.discount, 20); // 2*100*0.10
    expect(controller.grandTotal, 230);
  });
}
