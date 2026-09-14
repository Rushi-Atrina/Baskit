import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/categories_table.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.attachedDatabase);

  Stream<List<Category>> watchAll() {
    return (select(categories)..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .watch();
  }

  Future<int> count() async {
    final rows = await select(categories).get();
    return rows.length;
  }

  Future<void> replaceAll(List<CategoriesCompanion> entries) {
    return transaction(() async {
      await delete(categories).go();
      await batch((b) => b.insertAll(categories, entries));
    });
  }

  Future<void> clear() => delete(categories).go();
}
