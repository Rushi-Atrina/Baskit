import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/products_table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductDao extends DatabaseAccessor<AppDatabase>
    with _$ProductDaoMixin {
  ProductDao(super.attachedDatabase);

  Stream<List<Product>> watchByCategory(String categorySlug) {
    return (select(products)..where((t) => t.category.equals(categorySlug)))
        .watch();
  }

  /// All products, unfiltered — used for Dashboard's "Total Products" count.
  Stream<List<Product>> watchAll() => select(products).watch();

  Stream<Product?> watchById(int id) {
    return (select(products)..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<int> count() async {
    final rows = await select(products).get();
    return rows.length;
  }

  Future<void> replaceAll(List<ProductsCompanion> entries) {
    return transaction(() async {
      await delete(products).go();
      await batch((b) => b.insertAll(products, entries));
    });
  }

  Future<void> clear() => delete(products).go();
}
