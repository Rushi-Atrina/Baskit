import 'package:drift/drift.dart';

import 'categories_table.dart';

/// Products from GET /products?limit=200.
class Products extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get brand => text().nullable()();
  TextColumn get category =>
      text().references(Categories, #slug)();
  RealColumn get price => real()();
  RealColumn get discountPercentage => real().withDefault(const Constant(0))();
  RealColumn get rating => real().withDefault(const Constant(0))();
  IntColumn get stock => integer().withDefault(const Constant(0))();
  TextColumn get thumbnail => text()();

  /// JSON-encoded `List<String>` of gallery image URLs (carousel on Product Details).
  TextColumn get imagesJson => text().withDefault(const Constant('[]'))();

  @override
  Set<Column> get primaryKey => {id};
}
