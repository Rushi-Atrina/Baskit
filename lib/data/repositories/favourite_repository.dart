import '../local/database.dart';

/// requirements.md §8 (Favourite Module) — entirely local, Drift-backed.
class FavouriteRepository {
  FavouriteRepository(this._db);

  final AppDatabase _db;

  Stream<List<Product>> watchAll() => _db.favouriteDao.watchFavouriteProducts();

  Stream<bool> watchIsFavourite(int productId) =>
      _db.favouriteDao.watchIsFavourite(productId);

  Future<void> toggle(int productId) => _db.favouriteDao.toggle(productId);
}
