import '../local/database.dart';

/// Categories screen reads exclusively through here — never the API directly
/// (docs/architecture.md §1). Writes happen only from SyncRepository.
class CategoryRepository {
  CategoryRepository(this._db);

  final AppDatabase _db;

  Stream<List<Category>> watchAll() => _db.categoryDao.watchAll();

  Future<int> count() => _db.categoryDao.count();
}
