import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/cart_dao.dart';
import 'daos/category_dao.dart';
import 'daos/favourite_dao.dart';
import 'daos/product_dao.dart';
import 'daos/sync_meta_dao.dart';
import 'daos/user_dao.dart';
import 'tables/cart_table.dart';
import 'tables/categories_table.dart';
import 'tables/favourites_table.dart';
import 'tables/products_table.dart';
import 'tables/sync_meta_table.dart';
import 'tables/users_table.dart';

part 'database.g.dart';

/// App-wide Drift database. This is the single source of truth screens read
/// from — see docs/architecture.md §1 (API → Repository → Drift → GetX → UI).
@DriftDatabase(
  tables: [Users, Categories, Products, Favourites, CartItems, SyncMeta],
  daos: [UserDao, CategoryDao, ProductDao, FavouriteDao, CartDao, SyncMetaDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'baskit');
  }
}
