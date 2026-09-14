import 'package:drift/drift.dart';

import '../../services/google_auth_service.dart';
import '../local/database.dart';

/// Splash/Dashboard read [watchCurrentUser] (Drift) — never GoogleAuthService
/// directly — so login state survives offline app restarts
/// (docs/architecture.md §1, requirements.md "Offline Scenario").
class AuthRepository {
  AuthRepository(this._db, this._googleAuth);

  final AppDatabase _db;
  final GoogleAuthService _googleAuth;

  Stream<User?> watchCurrentUser() => _db.userDao.watchCurrentUser();

  /// Runs the interactive Google sign-in and persists the result to Drift.
  /// Throws [GoogleSignInException] on cancel/failure.
  Future<void> signIn() async {
    final account = await _googleAuth.signIn();
    await _db.userDao.upsertUser(
      UsersCompanion.insert(
        googleId: account.id,
        name: account.displayName ?? account.email,
        email: account.email,
        photoUrl: Value(account.photoUrl),
        lastLoginAt: DateTime.now(),
      ),
    );
  }

  /// Logout: clears only the session. Catalog/Cart/Favourites stay cached
  /// so the next login skips straight past Sync.
  Future<void> signOut() async {
    await _googleAuth.signOut();
    await _db.userDao.clear();
  }

  /// "Logout and Delete Account": clears the session AND wipes every local
  /// table, forcing a full re-sync on next login.
  Future<void> signOutAndDeleteAccount() async {
    await _googleAuth.signOut();
    await _db.transaction(() async {
      await _db.userDao.clear();
      await _db.categoryDao.clear();
      await _db.productDao.clear();
      await _db.favouriteDao.clear();
      await _db.cartDao.clear();
      await _db.syncMetaDao.clear();
    });
  }
}
