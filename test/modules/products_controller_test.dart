import 'package:baskit/data/local/database.dart';
import 'package:baskit/data/remote/api_client.dart';
import 'package:baskit/data/remote/dummyjson_api.dart';
import 'package:baskit/data/repositories/product_repository.dart';
import 'package:baskit/data/repositories/sync_repository.dart';
import 'package:baskit/modules/products/category_arg.dart';
import 'package:baskit/modules/products/product_sort_option.dart';
import 'package:baskit/modules/products/products_controller.dart';
import 'package:baskit/services/connectivity_service.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late ProductsController controller;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await db.categoryDao.replaceAll([
      CategoriesCompanion.insert(slug: 'beauty', name: 'Beauty'),
    ]);
    await db.productDao.replaceAll([
      ProductsCompanion.insert(
        id: const Value(1),
        title: 'Cheap Lotion',
        description: 'd',
        brand: const Value('Nivea'),
        category: 'beauty',
        price: 5,
        rating: const Value(4.8),
        thumbnail: 't',
      ),
      ProductsCompanion.insert(
        id: const Value(2),
        title: 'Expensive Serum',
        description: 'd',
        brand: const Value('Ordinary'),
        category: 'beauty',
        price: 50,
        rating: const Value(3.2),
        thumbnail: 't',
      ),
    ]);

    controller = ProductsController(
      ProductRepository(db),
      SyncRepository(db, DummyJsonApi(ApiClient()), ConnectivityService()),
      const CategoryArg(slug: 'beauty', name: 'Beauty'),
    );
    controller.onInit();
    // Let the Drift watch stream deliver its first value.
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);
  });

  tearDown(() {
    controller.onClose();
    return db.close();
  });

  test('visibleProducts returns all products with no filter/sort', () {
    expect(controller.visibleProducts.map((p) => p.id), containsAll([1, 2]));
  });

  test('search filters by title/brand case-insensitively', () {
    controller.searchQuery.value = 'ordinary';
    expect(controller.visibleProducts.map((p) => p.id), [2]);

    controller.searchQuery.value = 'serum';
    expect(controller.visibleProducts.map((p) => p.id), [2]);

    controller.searchQuery.value = 'nope';
    expect(controller.visibleProducts, isEmpty);
  });

  test('sort by price low to high', () {
    controller.sortOption.value = ProductSortOption.priceLowHigh;
    expect(controller.visibleProducts.map((p) => p.id).toList(), [1, 2]);
  });

  test('sort by rating high to low', () {
    controller.sortOption.value = ProductSortOption.ratingHighLow;
    expect(controller.visibleProducts.map((p) => p.id).toList(), [1, 2]);
  });
}
