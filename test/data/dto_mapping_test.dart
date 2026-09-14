import 'package:baskit/data/local/database.dart';
import 'package:baskit/data/models/category_dto.dart';
import 'package:baskit/data/models/product_dto.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  test('CategoryDto.fromJson + toCompanion round-trips into Drift', () async {
    final dto = CategoryDto.fromJson(const {
      'slug': 'beauty',
      'name': 'Beauty',
      'url': 'https://dummyjson.com/products/category/beauty',
    });

    await db.categoryDao.replaceAll([dto.toCompanion()]);

    final rows = await db.categoryDao.watchAll().first;
    expect(rows.single.slug, 'beauty');
    expect(rows.single.name, 'Beauty');
  });

  test('ProductDto.fromJson + toCompanion round-trips into Drift', () async {
    await db.categoryDao.replaceAll([
      CategoryDto.fromJson(const {'slug': 'beauty', 'name': 'Beauty'})
          .toCompanion(),
    ]);

    final dto = ProductDto.fromJson(const {
      'id': 1,
      'title': 'Essence Mascara',
      'description': 'desc',
      'category': 'beauty',
      'price': 9.99,
      'discountPercentage': 10.48,
      'rating': 2.56,
      'stock': 99,
      'brand': 'Essence',
      'thumbnail': 'https://cdn.dummyjson.com/thumb.webp',
      'images': ['https://cdn.dummyjson.com/1.webp'],
    });

    await db.productDao.replaceAll([dto.toCompanion()]);

    final rows = await db.productDao.watchByCategory('beauty').first;
    expect(rows.single.id, 1);
    expect(rows.single.price, 9.99);
    expect(rows.single.imagesJson, contains('cdn.dummyjson.com/1.webp'));
  });
}
