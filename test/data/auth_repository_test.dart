import 'package:baskit/data/local/database.dart';
import 'package:baskit/data/repositories/auth_repository.dart';
import 'package:baskit/services/google_auth_service.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

/// google_sign_in has no platform implementation in the plain test VM —
/// stub it out so these tests only exercise AuthRepository's Drift logic.
class _FakeGoogleAuthService extends GoogleAuthService {
  @override
  Future<void> signOut() async {}
}

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  Future<void> seedData() async {
    await db.userDao.upsertUser(
      UsersCompanion.insert(
        googleId: 'g1',
        name: 'Rushi',
        email: 'rushi@example.com',
        lastLoginAt: DateTime.now(),
      ),
    );
    await db.categoryDao.replaceAll([
      CategoriesCompanion.insert(slug: 'beauty', name: 'Beauty'),
    ]);
    await db.productDao.replaceAll([
      ProductsCompanion.insert(
        id: const Value(1),
        title: 'p',
        description: 'd',
        category: 'beauty',
        price: 1,
        thumbnail: 't',
      ),
    ]);
    await db.favouriteDao.add(1);
    await db.cartDao.addOrIncrement(1);
    await db.syncMetaDao.markSynced(categoriesCount: 1, productsCount: 1);
  }

  test('signOut clears only the session, keeps cached data', () async {
    await seedData();
    final repo = AuthRepository(db, _FakeGoogleAuthService());

    await repo.signOut();

    expect(await repo.watchCurrentUser().first, isNull);
    expect(await db.categoryDao.count(), 1);
    expect(await db.productDao.count(), 1);
    expect(await db.favouriteDao.watchFavouriteProducts().first, isNotEmpty);
    expect(await db.cartDao.watchCart().first, isNotEmpty);
    expect(await db.syncMetaDao.get(), isNotNull);
  });

  test('signOutAndDeleteAccount wipes every local table', () async {
    await seedData();
    final repo = AuthRepository(db, _FakeGoogleAuthService());

    await repo.signOutAndDeleteAccount();

    expect(await repo.watchCurrentUser().first, isNull);
    expect(await db.categoryDao.count(), 0);
    expect(await db.productDao.count(), 0);
    expect(await db.favouriteDao.watchFavouriteProducts().first, isEmpty);
    expect(await db.cartDao.watchCart().first, isEmpty);
    expect(await db.syncMetaDao.get(), isNull);
  });
}
