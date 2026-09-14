import 'package:drift/drift.dart';

/// Product categories from GET /products/categories.
@DataClassName('Category')
class Categories extends Table {
  TextColumn get slug => text()();
  TextColumn get name => text()();
  TextColumn get url => text().nullable()();

  @override
  Set<Column> get primaryKey => {slug};
}
