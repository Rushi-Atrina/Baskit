import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/sync_meta_table.dart';

part 'sync_meta_dao.g.dart';

const String kSyncMetaKey = 'main';

@DriftAccessor(tables: [SyncMeta])
class SyncMetaDao extends DatabaseAccessor<AppDatabase>
    with _$SyncMetaDaoMixin {
  SyncMetaDao(super.attachedDatabase);

  Stream<SyncMetaData?> watch() {
    return (select(syncMeta)..where((t) => t.key.equals(kSyncMetaKey)))
        .watchSingleOrNull();
  }

  Future<SyncMetaData?> get() {
    return (select(syncMeta)..where((t) => t.key.equals(kSyncMetaKey)))
        .getSingleOrNull();
  }

  Future<void> markSynced({
    required int categoriesCount,
    required int productsCount,
  }) {
    return into(syncMeta).insertOnConflictUpdate(
      SyncMetaCompanion.insert(
        key: kSyncMetaKey,
        lastSyncAt: Value(DateTime.now()),
        categoriesCount: Value(categoriesCount),
        productsCount: Value(productsCount),
      ),
    );
  }
}
