import 'package:drift/drift.dart';

import 'products_table.dart';

/// Cart items (requirements.md §9).
class CartItems extends Table {
  IntColumn get productId => integer().references(Products, #id)();
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  DateTimeColumn get addedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {productId};
}
