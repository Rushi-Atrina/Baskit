import 'package:drift/drift.dart';

import 'products_table.dart';

/// Favourited products (requirements.md §8).
class Favourites extends Table {
  IntColumn get productId => integer().references(Products, #id)();
  DateTimeColumn get addedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {productId};
}
