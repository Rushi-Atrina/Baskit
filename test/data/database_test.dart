import 'package:baskit/data/local/database.dart';
import 'package:baskit/data/repositories/cart_repository.dart';
import 'package:baskit/data/repositories/category_repository.dart';
import 'package:baskit/data/repositories/favourite_repository.dart';
import 'package:baskit/data/repositories/product_repository.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() => db.close());

  ProductsCompanion product({
    required int id,
    required String category,
    double price = 100,
    double rating = 4.5,
  }) {
    return ProductsCompanion.insert(
      id: Value(id),
      title: 'Product $id',
      description: 'desc',
      category: category,
      price: price,
      thumbnail: 'https://example.com/$id.png',
      rating: Value(rating),
    );
  }

  test('categories: replaceAll + watchAll reflects Drift state', () async {
    final repo = CategoryRepository(db);
    await db.categoryDao.replaceAll([
      CategoriesCompanion.insert(slug: 'beauty', name: 'Beauty'),
      CategoriesCompanion.insert(slug: 'furniture', name: 'Furniture'),
    ]);

    final result = await repo.watchAll().first;
    expect(result.map((c) => c.slug), containsAll(['beauty', 'furniture']));
    expect(await repo.count(), 2);
  });

  test('products: watchByCategory only returns matching rows', () async {
    final repo = ProductRepository(db);
    await db.categoryDao.replaceAll([
      CategoriesCompanion.insert(slug: 'beauty', name: 'Beauty'),
      CategoriesCompanion.insert(slug: 'furniture', name: 'Furniture'),
    ]);
    await db.productDao.replaceAll([
      product(id: 1, category: 'beauty'),
      product(id: 2, category: 'furniture'),
    ]);

    final beauty = await repo.watchByCategory('beauty').first;
    expect(beauty.map((p) => p.id), [1]);
  });

  test('favourites: toggle adds then removes', () async {
    await db.categoryDao.replaceAll([
      CategoriesCompanion.insert(slug: 'beauty', name: 'Beauty'),
    ]);
    await db.productDao.replaceAll([product(id: 1, category: 'beauty')]);
    final repo = FavouriteRepository(db);

    await repo.toggle(1);
    expect(await repo.watchIsFavourite(1).first, isTrue);

    await repo.toggle(1);
    expect(await repo.watchIsFavourite(1).first, isFalse);
  });

  test('cart: addOrIncrement accumulates quantity', () async {
    await db.categoryDao.replaceAll([
      CategoriesCompanion.insert(slug: 'beauty', name: 'Beauty'),
    ]);
    await db.productDao.replaceAll([
      product(id: 1, category: 'beauty', price: 50),
    ]);
    final repo = CartRepository(db);

    await repo.addOrIncrement(1);
    await repo.addOrIncrement(1, by: 2);

    final lines = await repo.watchCart().first;
    expect(lines, hasLength(1));
    expect(lines.single.quantity, 3);
    expect(lines.single.product.price, 50);
  });

  test('cart: updateQuantity to zero removes the line', () async {
    await db.categoryDao.replaceAll([
      CategoriesCompanion.insert(slug: 'beauty', name: 'Beauty'),
    ]);
    await db.productDao.replaceAll([product(id: 1, category: 'beauty')]);
    final repo = CartRepository(db);

    await repo.addOrIncrement(1);
    await repo.updateQuantity(1, 0);

    expect(await repo.watchCart().first, isEmpty);
  });

  test('syncMeta: markSynced is readable back', () async {
    await db.syncMetaDao.markSynced(categoriesCount: 7, productsCount: 200);

    final meta = await db.syncMetaDao.get();
    expect(meta, isNotNull);
    expect(meta!.categoriesCount, 7);
    expect(meta.productsCount, 200);
    expect(meta.lastSyncAt, isNotNull);
  });
}
