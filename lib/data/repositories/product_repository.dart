import '../local/database.dart';

/// Products/Product Details screens read exclusively through here.
/// Search and sort are applied by the controller in-memory over the
/// category stream (docs/architecture.md §5) — this repository only
/// exposes the raw Drift-backed data.
class ProductRepository {
  ProductRepository(this._db);

  final AppDatabase _db;

  Stream<List<Product>> watchByCategory(String categorySlug) =>
      _db.productDao.watchByCategory(categorySlug);

  Stream<List<Product>> watchAll() => _db.productDao.watchAll();

  Stream<Product?> watchById(int id) => _db.productDao.watchById(id);

  Future<int> count() => _db.productDao.count();

  /// One representative thumbnail per category slug (the first product
  /// found for that category), for the Categories screen cards. Derived
  /// from the already-synced Products table — no extra API call.
  Stream<Map<String, String>> watchThumbnailByCategory() {
    return _db.productDao.watchAll().map((products) {
      final map = <String, String>{};
      for (final product in products) {
        map.putIfAbsent(product.category, () => product.thumbnail);
      }
      return map;
    });
  }
}
