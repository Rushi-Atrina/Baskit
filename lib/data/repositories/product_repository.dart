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
}
