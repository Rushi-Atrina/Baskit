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

  Future<void> signOut() async {
    await _googleAuth.signOut();
    await _db.userDao.clear();
  }
}
