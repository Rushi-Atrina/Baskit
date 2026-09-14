import 'package:drift/drift.dart';

/// Locally persisted Google account, per requirements.md §1 (Authentication).
class Users extends Table {
  TextColumn get googleId => text()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get photoUrl => text().nullable()();
  DateTimeColumn get lastLoginAt => dateTime()();

  @override
  Set<Column> get primaryKey => {googleId};
}
