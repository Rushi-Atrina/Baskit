import 'package:baskit/data/local/database.dart';
import 'package:baskit/data/models/category_dto.dart';
import 'package:baskit/data/models/product_dto.dart';
import 'package:baskit/data/remote/api_client.dart';
import 'package:baskit/data/remote/api_exception.dart';
import 'package:baskit/data/remote/dummyjson_api.dart';
import 'package:baskit/data/repositories/sync_progress.dart';
import 'package:baskit/data/repositories/sync_repository.dart';
import 'package:baskit/services/connectivity_service.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeApi extends DummyJsonApi {
  _FakeApi() : super(ApiClient());

  @override
  Future<List<CategoryDto>> getCategories() async {
    return [const CategoryDto(slug: 'beauty', name: 'Beauty')];
  }

  @override
  Future<List<ProductDto>> getProducts({
    int limit = 200,
    void Function(double percent)? onProgress,
  }) async {
    onProgress?.call(50);
    return const [
      ProductDto(
        id: 1,
        title: 'Mascara',
        description: 'desc',
        category: 'beauty',
        price: 9.99,
        thumbnail: 'https://example.com/1.png',
      ),
    ];
  }
}

class _AlwaysOnline extends ConnectivityService {
  @override
  Future<bool> hasConnection() async => true;
}

class _AlwaysOffline extends ConnectivityService {
  @override
  Future<bool> hasConnection() async => false;
}

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  test('syncAll writes categories/products/meta and reports progress', () async {
    final repo = SyncRepository(db, _FakeApi(), _AlwaysOnline());

    final events = await repo.syncAll().toList();

    expect(events.map((e) => e.step), [
      SyncStep.categories,
      SyncStep.categories,
      SyncStep.products,
      SyncStep.products,
      SyncStep.products,
      SyncStep.done,
    ]);
    expect(events.last.completed, isTrue);

    final categories = await db.categoryDao.watchAll().first;
    final products = await db.productDao.watchByCategory('beauty').first;
    final meta = await db.syncMetaDao.get();

    expect(categories.single.slug, 'beauty');
    expect(products.single.id, 1);
    expect(meta?.categoriesCount, 1);
    expect(meta?.productsCount, 1);
    expect(meta?.lastSyncAt, isNotNull);
  });

  test('syncAll emits NoInternetException without touching Drift when offline', () async {
    final repo = SyncRepository(db, _FakeApi(), _AlwaysOffline());

    await expectLater(
      repo.syncAll(),
      emitsError(isA<NoInternetException>()),
    );

    expect(await db.categoryDao.count(), 0);
    expect(await db.syncMetaDao.get(), isNull);
  });
}
