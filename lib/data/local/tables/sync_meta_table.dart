import 'package:drift/drift.dart';

/// Single-row-per-key metadata table backing Dashboard's "Last Sync Date"
/// and the offline-first "has an initial sync completed?" check.
class SyncMeta extends Table {
  TextColumn get key => text()();
  DateTimeColumn get lastSyncAt => dateTime().nullable()();
  IntColumn get categoriesCount => integer().withDefault(const Constant(0))();
  IntColumn get productsCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {key};
}
