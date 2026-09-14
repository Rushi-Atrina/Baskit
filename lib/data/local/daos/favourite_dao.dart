import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/favourites_table.dart';
import '../tables/products_table.dart';

part 'favourite_dao.g.dart';

@DriftAccessor(tables: [Favourites, Products])
class FavouriteDao extends DatabaseAccessor<AppDatabase>
    with _$FavouriteDaoMixin {
  FavouriteDao(super.attachedDatabase);

  /// Favourited products joined with their product row, newest-first.
  Stream<List<Product>> watchFavouriteProducts() {
    final query = select(favourites).join([
      innerJoin(products, products.id.equalsExp(favourites.productId)),
    ])..orderBy([OrderingTerm.desc(favourites.addedAt)]);

    return query.watch().map(
          (rows) => rows.map((row) => row.readTable(products)).toList(),
        );
  }

  Stream<bool> watchIsFavourite(int productId) {
    return (select(favourites)..where((t) => t.productId.equals(productId)))
        .watchSingleOrNull()
        .map((row) => row != null);
  }

  Future<void> add(int productId) {
    return into(favourites).insertOnConflictUpdate(
      FavouritesCompanion.insert(
        productId: Value(productId),
        addedAt: DateTime.now(),
      ),
    );
  }

  Future<void> remove(int productId) {
    return (delete(favourites)..where((t) => t.productId.equals(productId)))
        .go();
  }

  Future<void> toggle(int productId) async {
    final exists = await (select(favourites)
          ..where((t) => t.productId.equals(productId)))
        .getSingleOrNull();
    if (exists != null) {
      await remove(productId);
    } else {
      await add(productId);
    }
  }
}
