// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_dao.dart';

// ignore_for_file: type=lint
mixin _$FavouriteDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
  $ProductsTable get products => attachedDatabase.products;
  $FavouritesTable get favourites => attachedDatabase.favourites;
  FavouriteDaoManager get managers => FavouriteDaoManager(this);
}

class FavouriteDaoManager {
  final _$FavouriteDaoMixin _db;
  FavouriteDaoManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$FavouritesTableTableManager get favourites =>
      $$FavouritesTableTableManager(_db.attachedDatabase, _db.favourites);
}
