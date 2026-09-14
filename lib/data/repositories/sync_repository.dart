import '../local/database.dart';

/// Read-side for now (Dashboard/Splash need "has an initial sync happened,
/// and when"). Phase 4 extends this with syncAll() (API -> Drift, per
/// docs/architecture.md §5 "Sync").
class SyncRepository {
  SyncRepository(this._db);

  final AppDatabase _db;

  Stream<SyncMetaData?> watchMeta() => _db.syncMetaDao.watch();

  Future<SyncMetaData?> getMeta() => _db.syncMetaDao.get();

  Future<bool> hasSyncedOnce() async {
    final meta = await getMeta();
    return meta?.lastSyncAt != null;
  }
}
