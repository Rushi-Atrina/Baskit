import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/users_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.attachedDatabase);

  /// Emits the currently signed-in user, or null if none / logged out.
  /// Splash/Dashboard use this instead of calling Google APIs directly.
  Stream<User?> watchCurrentUser() {
    return select(users).watchSingleOrNull();
  }

  Future<void> upsertUser(UsersCompanion entry) {
    return into(users).insertOnConflictUpdate(entry);
  }

  Future<void> clear() => delete(users).go();
}
