// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _googleIdMeta = const VerificationMeta(
    'googleId',
  );
  @override
  late final GeneratedColumn<String> googleId = GeneratedColumn<String>(
    'google_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoUrlMeta = const VerificationMeta(
    'photoUrl',
  );
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
    'photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastLoginAtMeta = const VerificationMeta(
    'lastLoginAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastLoginAt = GeneratedColumn<DateTime>(
    'last_login_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    googleId,
    name,
    email,
    photoUrl,
    lastLoginAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('google_id')) {
      context.handle(
        _googleIdMeta,
        googleId.isAcceptableOrUnknown(data['google_id']!, _googleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_googleIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('photo_url')) {
      context.handle(
        _photoUrlMeta,
        photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta),
      );
    }
    if (data.containsKey('last_login_at')) {
      context.handle(
        _lastLoginAtMeta,
        lastLoginAt.isAcceptableOrUnknown(
          data['last_login_at']!,
          _lastLoginAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastLoginAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {googleId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      googleId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}google_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      photoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_url'],
      ),
      lastLoginAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}last_login_at'],
          )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String googleId;
  final String name;
  final String email;
  final String? photoUrl;
  final DateTime lastLoginAt;
  const User({
    required this.googleId,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.lastLoginAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['google_id'] = Variable<String>(googleId);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    map['last_login_at'] = Variable<DateTime>(lastLoginAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      googleId: Value(googleId),
      name: Value(name),
      email: Value(email),
      photoUrl:
          photoUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(photoUrl),
      lastLoginAt: Value(lastLoginAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      googleId: serializer.fromJson<String>(json['googleId']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      lastLoginAt: serializer.fromJson<DateTime>(json['lastLoginAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'googleId': serializer.toJson<String>(googleId),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'lastLoginAt': serializer.toJson<DateTime>(lastLoginAt),
    };
  }

  User copyWith({
    String? googleId,
    String? name,
    String? email,
    Value<String?> photoUrl = const Value.absent(),
    DateTime? lastLoginAt,
  }) => User(
    googleId: googleId ?? this.googleId,
    name: name ?? this.name,
    email: email ?? this.email,
    photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
    lastLoginAt: lastLoginAt ?? this.lastLoginAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      googleId: data.googleId.present ? data.googleId.value : this.googleId,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      lastLoginAt:
          data.lastLoginAt.present ? data.lastLoginAt.value : this.lastLoginAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('googleId: $googleId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('lastLoginAt: $lastLoginAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(googleId, name, email, photoUrl, lastLoginAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.googleId == this.googleId &&
          other.name == this.name &&
          other.email == this.email &&
          other.photoUrl == this.photoUrl &&
          other.lastLoginAt == this.lastLoginAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> googleId;
  final Value<String> name;
  final Value<String> email;
  final Value<String?> photoUrl;
  final Value<DateTime> lastLoginAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.googleId = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String googleId,
    required String name,
    required String email,
    this.photoUrl = const Value.absent(),
    required DateTime lastLoginAt,
    this.rowid = const Value.absent(),
  }) : googleId = Value(googleId),
       name = Value(name),
       email = Value(email),
       lastLoginAt = Value(lastLoginAt);
  static Insertable<User> custom({
    Expression<String>? googleId,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? photoUrl,
    Expression<DateTime>? lastLoginAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (googleId != null) 'google_id': googleId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (lastLoginAt != null) 'last_login_at': lastLoginAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? googleId,
    Value<String>? name,
    Value<String>? email,
    Value<String?>? photoUrl,
    Value<DateTime>? lastLoginAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      googleId: googleId ?? this.googleId,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (googleId.present) {
      map['google_id'] = Variable<String>(googleId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (lastLoginAt.present) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('googleId: $googleId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('lastLoginAt: $lastLoginAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [slug, name, url];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {slug};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      slug:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}slug'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final String slug;
  final String name;
  final String? url;
  const Category({required this.slug, required this.name, this.url});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['slug'] = Variable<String>(slug);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      slug: Value(slug),
      name: Value(name),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      slug: serializer.fromJson<String>(json['slug']),
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'slug': serializer.toJson<String>(slug),
      'name': serializer.toJson<String>(name),
      'url': serializer.toJson<String?>(url),
    };
  }

  Category copyWith({
    String? slug,
    String? name,
    Value<String?> url = const Value.absent(),
  }) => Category(
    slug: slug ?? this.slug,
    name: name ?? this.name,
    url: url.present ? url.value : this.url,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      slug: data.slug.present ? data.slug.value : this.slug,
      name: data.name.present ? data.name.value : this.name,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(slug, name, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.slug == this.slug &&
          other.name == this.name &&
          other.url == this.url);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> slug;
  final Value<String> name;
  final Value<String?> url;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.slug = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String slug,
    required String name,
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : slug = Value(slug),
       name = Value(name);
  static Insertable<Category> custom({
    Expression<String>? slug,
    Expression<String>? name,
    Expression<String>? url,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (slug != null) 'slug': slug,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? slug,
    Value<String>? name,
    Value<String?>? url,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      slug: slug ?? this.slug,
      name: name ?? this.name,
      url: url ?? this.url,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (slug)',
    ),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  @override
  late final GeneratedColumn<double> discountPercentage =
      GeneratedColumn<double>(
        'discount_percentage',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagesJsonMeta = const VerificationMeta(
    'imagesJson',
  );
  @override
  late final GeneratedColumn<String> imagesJson = GeneratedColumn<String>(
    'images_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    brand,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    thumbnail,
    imagesJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
        _discountPercentageMeta,
        discountPercentage.isAcceptableOrUnknown(
          data['discount_percentage']!,
          _discountPercentageMeta,
        ),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    if (data.containsKey('images_json')) {
      context.handle(
        _imagesJsonMeta,
        imagesJson.isAcceptableOrUnknown(data['images_json']!, _imagesJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
      price:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}price'],
          )!,
      discountPercentage:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}discount_percentage'],
          )!,
      rating:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}rating'],
          )!,
      stock:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}stock'],
          )!,
      thumbnail:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}thumbnail'],
          )!,
      imagesJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}images_json'],
          )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String title;
  final String description;
  final String? brand;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String thumbnail;

  /// JSON-encoded `List<String>` of gallery image URLs (carousel on Product Details).
  final String imagesJson;
  const Product({
    required this.id,
    required this.title,
    required this.description,
    this.brand,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.imagesJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    map['category'] = Variable<String>(category);
    map['price'] = Variable<double>(price);
    map['discount_percentage'] = Variable<double>(discountPercentage);
    map['rating'] = Variable<double>(rating);
    map['stock'] = Variable<int>(stock);
    map['thumbnail'] = Variable<String>(thumbnail);
    map['images_json'] = Variable<String>(imagesJson);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      category: Value(category),
      price: Value(price),
      discountPercentage: Value(discountPercentage),
      rating: Value(rating),
      stock: Value(stock),
      thumbnail: Value(thumbnail),
      imagesJson: Value(imagesJson),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      brand: serializer.fromJson<String?>(json['brand']),
      category: serializer.fromJson<String>(json['category']),
      price: serializer.fromJson<double>(json['price']),
      discountPercentage: serializer.fromJson<double>(
        json['discountPercentage'],
      ),
      rating: serializer.fromJson<double>(json['rating']),
      stock: serializer.fromJson<int>(json['stock']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      imagesJson: serializer.fromJson<String>(json['imagesJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'brand': serializer.toJson<String?>(brand),
      'category': serializer.toJson<String>(category),
      'price': serializer.toJson<double>(price),
      'discountPercentage': serializer.toJson<double>(discountPercentage),
      'rating': serializer.toJson<double>(rating),
      'stock': serializer.toJson<int>(stock),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'imagesJson': serializer.toJson<String>(imagesJson),
    };
  }

  Product copyWith({
    int? id,
    String? title,
    String? description,
    Value<String?> brand = const Value.absent(),
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? thumbnail,
    String? imagesJson,
  }) => Product(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    brand: brand.present ? brand.value : this.brand,
    category: category ?? this.category,
    price: price ?? this.price,
    discountPercentage: discountPercentage ?? this.discountPercentage,
    rating: rating ?? this.rating,
    stock: stock ?? this.stock,
    thumbnail: thumbnail ?? this.thumbnail,
    imagesJson: imagesJson ?? this.imagesJson,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      brand: data.brand.present ? data.brand.value : this.brand,
      category: data.category.present ? data.category.value : this.category,
      price: data.price.present ? data.price.value : this.price,
      discountPercentage:
          data.discountPercentage.present
              ? data.discountPercentage.value
              : this.discountPercentage,
      rating: data.rating.present ? data.rating.value : this.rating,
      stock: data.stock.present ? data.stock.value : this.stock,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      imagesJson:
          data.imagesJson.present ? data.imagesJson.value : this.imagesJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('brand: $brand, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('rating: $rating, ')
          ..write('stock: $stock, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('imagesJson: $imagesJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    brand,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    thumbnail,
    imagesJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.brand == this.brand &&
          other.category == this.category &&
          other.price == this.price &&
          other.discountPercentage == this.discountPercentage &&
          other.rating == this.rating &&
          other.stock == this.stock &&
          other.thumbnail == this.thumbnail &&
          other.imagesJson == this.imagesJson);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String?> brand;
  final Value<String> category;
  final Value<double> price;
  final Value<double> discountPercentage;
  final Value<double> rating;
  final Value<int> stock;
  final Value<String> thumbnail;
  final Value<String> imagesJson;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.brand = const Value.absent(),
    this.category = const Value.absent(),
    this.price = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.rating = const Value.absent(),
    this.stock = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.imagesJson = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    this.brand = const Value.absent(),
    required String category,
    required double price,
    this.discountPercentage = const Value.absent(),
    this.rating = const Value.absent(),
    this.stock = const Value.absent(),
    required String thumbnail,
    this.imagesJson = const Value.absent(),
  }) : title = Value(title),
       description = Value(description),
       category = Value(category),
       price = Value(price),
       thumbnail = Value(thumbnail);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? brand,
    Expression<String>? category,
    Expression<double>? price,
    Expression<double>? discountPercentage,
    Expression<double>? rating,
    Expression<int>? stock,
    Expression<String>? thumbnail,
    Expression<String>? imagesJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (brand != null) 'brand': brand,
      if (category != null) 'category': category,
      if (price != null) 'price': price,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (rating != null) 'rating': rating,
      if (stock != null) 'stock': stock,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (imagesJson != null) 'images_json': imagesJson,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String?>? brand,
    Value<String>? category,
    Value<double>? price,
    Value<double>? discountPercentage,
    Value<double>? rating,
    Value<int>? stock,
    Value<String>? thumbnail,
    Value<String>? imagesJson,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      thumbnail: thumbnail ?? this.thumbnail,
      imagesJson: imagesJson ?? this.imagesJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (imagesJson.present) {
      map['images_json'] = Variable<String>(imagesJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('brand: $brand, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('rating: $rating, ')
          ..write('stock: $stock, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('imagesJson: $imagesJson')
          ..write(')'))
        .toString();
  }
}

class $FavouritesTable extends Favourites
    with TableInfo<$FavouritesTable, Favourite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavouritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [productId, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favourites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favourite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  Favourite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favourite(
      productId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}product_id'],
          )!,
      addedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}added_at'],
          )!,
    );
  }

  @override
  $FavouritesTable createAlias(String alias) {
    return $FavouritesTable(attachedDatabase, alias);
  }
}

class Favourite extends DataClass implements Insertable<Favourite> {
  final int productId;
  final DateTime addedAt;
  const Favourite({required this.productId, required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<int>(productId);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavouritesCompanion toCompanion(bool nullToAbsent) {
    return FavouritesCompanion(
      productId: Value(productId),
      addedAt: Value(addedAt),
    );
  }

  factory Favourite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favourite(
      productId: serializer.fromJson<int>(json['productId']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  Favourite copyWith({int? productId, DateTime? addedAt}) => Favourite(
    productId: productId ?? this.productId,
    addedAt: addedAt ?? this.addedAt,
  );
  Favourite copyWithCompanion(FavouritesCompanion data) {
    return Favourite(
      productId: data.productId.present ? data.productId.value : this.productId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favourite(')
          ..write('productId: $productId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favourite &&
          other.productId == this.productId &&
          other.addedAt == this.addedAt);
}

class FavouritesCompanion extends UpdateCompanion<Favourite> {
  final Value<int> productId;
  final Value<DateTime> addedAt;
  const FavouritesCompanion({
    this.productId = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  FavouritesCompanion.insert({
    this.productId = const Value.absent(),
    required DateTime addedAt,
  }) : addedAt = Value(addedAt);
  static Insertable<Favourite> custom({
    Expression<int>? productId,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  FavouritesCompanion copyWith({
    Value<int>? productId,
    Value<DateTime>? addedAt,
  }) {
    return FavouritesCompanion(
      productId: productId ?? this.productId,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavouritesCompanion(')
          ..write('productId: $productId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class $CartItemsTable extends CartItems
    with TableInfo<$CartItemsTable, CartItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [productId, quantity, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  CartItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartItem(
      productId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}product_id'],
          )!,
      quantity:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}quantity'],
          )!,
      addedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}added_at'],
          )!,
    );
  }

  @override
  $CartItemsTable createAlias(String alias) {
    return $CartItemsTable(attachedDatabase, alias);
  }
}

class CartItem extends DataClass implements Insertable<CartItem> {
  final int productId;
  final int quantity;
  final DateTime addedAt;
  const CartItem({
    required this.productId,
    required this.quantity,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<int>(quantity);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  CartItemsCompanion toCompanion(bool nullToAbsent) {
    return CartItemsCompanion(
      productId: Value(productId),
      quantity: Value(quantity),
      addedAt: Value(addedAt),
    );
  }

  factory CartItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartItem(
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<int>(quantity),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  CartItem copyWith({int? productId, int? quantity, DateTime? addedAt}) =>
      CartItem(
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        addedAt: addedAt ?? this.addedAt,
      );
  CartItem copyWithCompanion(CartItemsCompanion data) {
    return CartItem(
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartItem(')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, quantity, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItem &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.addedAt == this.addedAt);
}

class CartItemsCompanion extends UpdateCompanion<CartItem> {
  final Value<int> productId;
  final Value<int> quantity;
  final Value<DateTime> addedAt;
  const CartItemsCompanion({
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  CartItemsCompanion.insert({
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    required DateTime addedAt,
  }) : addedAt = Value(addedAt);
  static Insertable<CartItem> custom({
    Expression<int>? productId,
    Expression<int>? quantity,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  CartItemsCompanion copyWith({
    Value<int>? productId,
    Value<int>? quantity,
    Value<DateTime>? addedAt,
  }) {
    return CartItemsCompanion(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemsCompanion(')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class $SyncMetaTable extends SyncMeta
    with TableInfo<$SyncMetaTable, SyncMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncAtMeta = const VerificationMeta(
    'lastSyncAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncAt = GeneratedColumn<DateTime>(
    'last_sync_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoriesCountMeta = const VerificationMeta(
    'categoriesCount',
  );
  @override
  late final GeneratedColumn<int> categoriesCount = GeneratedColumn<int>(
    'categories_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _productsCountMeta = const VerificationMeta(
    'productsCount',
  );
  @override
  late final GeneratedColumn<int> productsCount = GeneratedColumn<int>(
    'products_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    lastSyncAt,
    categoriesCount,
    productsCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('last_sync_at')) {
      context.handle(
        _lastSyncAtMeta,
        lastSyncAt.isAcceptableOrUnknown(
          data['last_sync_at']!,
          _lastSyncAtMeta,
        ),
      );
    }
    if (data.containsKey('categories_count')) {
      context.handle(
        _categoriesCountMeta,
        categoriesCount.isAcceptableOrUnknown(
          data['categories_count']!,
          _categoriesCountMeta,
        ),
      );
    }
    if (data.containsKey('products_count')) {
      context.handle(
        _productsCountMeta,
        productsCount.isAcceptableOrUnknown(
          data['products_count']!,
          _productsCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SyncMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetaData(
      key:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}key'],
          )!,
      lastSyncAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_at'],
      ),
      categoriesCount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}categories_count'],
          )!,
      productsCount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}products_count'],
          )!,
    );
  }

  @override
  $SyncMetaTable createAlias(String alias) {
    return $SyncMetaTable(attachedDatabase, alias);
  }
}

class SyncMetaData extends DataClass implements Insertable<SyncMetaData> {
  final String key;
  final DateTime? lastSyncAt;
  final int categoriesCount;
  final int productsCount;
  const SyncMetaData({
    required this.key,
    this.lastSyncAt,
    required this.categoriesCount,
    required this.productsCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || lastSyncAt != null) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt);
    }
    map['categories_count'] = Variable<int>(categoriesCount);
    map['products_count'] = Variable<int>(productsCount);
    return map;
  }

  SyncMetaCompanion toCompanion(bool nullToAbsent) {
    return SyncMetaCompanion(
      key: Value(key),
      lastSyncAt:
          lastSyncAt == null && nullToAbsent
              ? const Value.absent()
              : Value(lastSyncAt),
      categoriesCount: Value(categoriesCount),
      productsCount: Value(productsCount),
    );
  }

  factory SyncMetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetaData(
      key: serializer.fromJson<String>(json['key']),
      lastSyncAt: serializer.fromJson<DateTime?>(json['lastSyncAt']),
      categoriesCount: serializer.fromJson<int>(json['categoriesCount']),
      productsCount: serializer.fromJson<int>(json['productsCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'lastSyncAt': serializer.toJson<DateTime?>(lastSyncAt),
      'categoriesCount': serializer.toJson<int>(categoriesCount),
      'productsCount': serializer.toJson<int>(productsCount),
    };
  }

  SyncMetaData copyWith({
    String? key,
    Value<DateTime?> lastSyncAt = const Value.absent(),
    int? categoriesCount,
    int? productsCount,
  }) => SyncMetaData(
    key: key ?? this.key,
    lastSyncAt: lastSyncAt.present ? lastSyncAt.value : this.lastSyncAt,
    categoriesCount: categoriesCount ?? this.categoriesCount,
    productsCount: productsCount ?? this.productsCount,
  );
  SyncMetaData copyWithCompanion(SyncMetaCompanion data) {
    return SyncMetaData(
      key: data.key.present ? data.key.value : this.key,
      lastSyncAt:
          data.lastSyncAt.present ? data.lastSyncAt.value : this.lastSyncAt,
      categoriesCount:
          data.categoriesCount.present
              ? data.categoriesCount.value
              : this.categoriesCount,
      productsCount:
          data.productsCount.present
              ? data.productsCount.value
              : this.productsCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaData(')
          ..write('key: $key, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('categoriesCount: $categoriesCount, ')
          ..write('productsCount: $productsCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(key, lastSyncAt, categoriesCount, productsCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetaData &&
          other.key == this.key &&
          other.lastSyncAt == this.lastSyncAt &&
          other.categoriesCount == this.categoriesCount &&
          other.productsCount == this.productsCount);
}

class SyncMetaCompanion extends UpdateCompanion<SyncMetaData> {
  final Value<String> key;
  final Value<DateTime?> lastSyncAt;
  final Value<int> categoriesCount;
  final Value<int> productsCount;
  final Value<int> rowid;
  const SyncMetaCompanion({
    this.key = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.categoriesCount = const Value.absent(),
    this.productsCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetaCompanion.insert({
    required String key,
    this.lastSyncAt = const Value.absent(),
    this.categoriesCount = const Value.absent(),
    this.productsCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key);
  static Insertable<SyncMetaData> custom({
    Expression<String>? key,
    Expression<DateTime>? lastSyncAt,
    Expression<int>? categoriesCount,
    Expression<int>? productsCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (lastSyncAt != null) 'last_sync_at': lastSyncAt,
      if (categoriesCount != null) 'categories_count': categoriesCount,
      if (productsCount != null) 'products_count': productsCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetaCompanion copyWith({
    Value<String>? key,
    Value<DateTime?>? lastSyncAt,
    Value<int>? categoriesCount,
    Value<int>? productsCount,
    Value<int>? rowid,
  }) {
    return SyncMetaCompanion(
      key: key ?? this.key,
      lastSyncAt: lastSyncAt ?? this.lastSyncAt,
      categoriesCount: categoriesCount ?? this.categoriesCount,
      productsCount: productsCount ?? this.productsCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (lastSyncAt.present) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt.value);
    }
    if (categoriesCount.present) {
      map['categories_count'] = Variable<int>(categoriesCount.value);
    }
    if (productsCount.present) {
      map['products_count'] = Variable<int>(productsCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaCompanion(')
          ..write('key: $key, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('categoriesCount: $categoriesCount, ')
          ..write('productsCount: $productsCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $FavouritesTable favourites = $FavouritesTable(this);
  late final $CartItemsTable cartItems = $CartItemsTable(this);
  late final $SyncMetaTable syncMeta = $SyncMetaTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);
  late final ProductDao productDao = ProductDao(this as AppDatabase);
  late final FavouriteDao favouriteDao = FavouriteDao(this as AppDatabase);
  late final CartDao cartDao = CartDao(this as AppDatabase);
  late final SyncMetaDao syncMetaDao = SyncMetaDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    categories,
    products,
    favourites,
    cartItems,
    syncMeta,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String googleId,
      required String name,
      required String email,
      Value<String?> photoUrl,
      required DateTime lastLoginAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> googleId,
      Value<String> name,
      Value<String> email,
      Value<String?> photoUrl,
      Value<DateTime> lastLoginAt,
      Value<int> rowid,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get googleId => $composableBuilder(
    column: $table.googleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastLoginAt => $composableBuilder(
    column: $table.lastLoginAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get googleId => $composableBuilder(
    column: $table.googleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastLoginAt => $composableBuilder(
    column: $table.lastLoginAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get googleId =>
      $composableBuilder(column: $table.googleId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLoginAt => $composableBuilder(
    column: $table.lastLoginAt,
    builder: (column) => column,
  );
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> googleId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<DateTime> lastLoginAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                googleId: googleId,
                name: name,
                email: email,
                photoUrl: photoUrl,
                lastLoginAt: lastLoginAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String googleId,
                required String name,
                required String email,
                Value<String?> photoUrl = const Value.absent(),
                required DateTime lastLoginAt,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                googleId: googleId,
                name: name,
                email: email,
                photoUrl: photoUrl,
                lastLoginAt: lastLoginAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String slug,
      required String name,
      Value<String?> url,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> slug,
      Value<String> name,
      Value<String?> url,
      Value<int> rowid,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<Product>> _productsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.products,
    aliasName: $_aliasNameGenerator(db.categories.slug, db.products.category),
  );

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.category.slug.sqlEquals($_itemColumn<String>('slug')!));

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productsRefs(
    Expression<bool> Function($$ProductsTableFilterComposer f) f,
  ) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slug,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.category,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  Expression<T> productsRefs<T extends Object>(
    Expression<T> Function($$ProductsTableAnnotationComposer a) f,
  ) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slug,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.category,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool productsRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> slug = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                slug: slug,
                name: name,
                url: url,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String slug,
                required String name,
                Value<String?> url = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                slug: slug,
                name: name,
                url: url,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CategoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({productsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productsRefs) db.products],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsRefs)
                    await $_getPrefetchedData<
                      Category,
                      $CategoriesTable,
                      Product
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._productsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).productsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.category == item.slug,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool productsRefs})
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      Value<String?> brand,
      required String category,
      required double price,
      Value<double> discountPercentage,
      Value<double> rating,
      Value<int> stock,
      required String thumbnail,
      Value<String> imagesJson,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String?> brand,
      Value<String> category,
      Value<double> price,
      Value<double> discountPercentage,
      Value<double> rating,
      Value<int> stock,
      Value<String> thumbnail,
      Value<String> imagesJson,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.products.category, db.categories.slug),
      );

  $$CategoriesTableProcessedTableManager get category {
    final $_column = $_itemColumn<String>('category')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.slug.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FavouritesTable, List<Favourite>>
  _favouritesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.favourites,
    aliasName: $_aliasNameGenerator(db.products.id, db.favourites.productId),
  );

  $$FavouritesTableProcessedTableManager get favouritesRefs {
    final manager = $$FavouritesTableTableManager(
      $_db,
      $_db.favourites,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_favouritesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CartItemsTable, List<CartItem>>
  _cartItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cartItems,
    aliasName: $_aliasNameGenerator(db.products.id, db.cartItems.productId),
  );

  $$CartItemsTableProcessedTableManager get cartItemsRefs {
    final manager = $$CartItemsTableTableManager(
      $_db,
      $_db.cartItems,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cartItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagesJson => $composableBuilder(
    column: $table.imagesJson,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get category {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.category,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> favouritesRefs(
    Expression<bool> Function($$FavouritesTableFilterComposer f) f,
  ) {
    final $$FavouritesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favourites,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavouritesTableFilterComposer(
            $db: $db,
            $table: $db.favourites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cartItemsRefs(
    Expression<bool> Function($$CartItemsTableFilterComposer f) f,
  ) {
    final $$CartItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cartItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CartItemsTableFilterComposer(
            $db: $db,
            $table: $db.cartItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagesJson => $composableBuilder(
    column: $table.imagesJson,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get category {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.category,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<String> get imagesJson => $composableBuilder(
    column: $table.imagesJson,
    builder: (column) => column,
  );

  $$CategoriesTableAnnotationComposer get category {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.category,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> favouritesRefs<T extends Object>(
    Expression<T> Function($$FavouritesTableAnnotationComposer a) f,
  ) {
    final $$FavouritesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favourites,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavouritesTableAnnotationComposer(
            $db: $db,
            $table: $db.favourites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> cartItemsRefs<T extends Object>(
    Expression<T> Function($$CartItemsTableAnnotationComposer a) f,
  ) {
    final $$CartItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cartItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CartItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.cartItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, $$ProductsTableReferences),
          Product,
          PrefetchHooks Function({
            bool category,
            bool favouritesRefs,
            bool cartItemsRefs,
          })
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> discountPercentage = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<String> thumbnail = const Value.absent(),
                Value<String> imagesJson = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                title: title,
                description: description,
                brand: brand,
                category: category,
                price: price,
                discountPercentage: discountPercentage,
                rating: rating,
                stock: stock,
                thumbnail: thumbnail,
                imagesJson: imagesJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                Value<String?> brand = const Value.absent(),
                required String category,
                required double price,
                Value<double> discountPercentage = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> stock = const Value.absent(),
                required String thumbnail,
                Value<String> imagesJson = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                title: title,
                description: description,
                brand: brand,
                category: category,
                price: price,
                discountPercentage: discountPercentage,
                rating: rating,
                stock: stock,
                thumbnail: thumbnail,
                imagesJson: imagesJson,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ProductsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            category = false,
            favouritesRefs = false,
            cartItemsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (favouritesRefs) db.favourites,
                if (cartItemsRefs) db.cartItems,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (category) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.category,
                            referencedTable: $$ProductsTableReferences
                                ._categoryTable(db),
                            referencedColumn:
                                $$ProductsTableReferences
                                    ._categoryTable(db)
                                    .slug,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (favouritesRefs)
                    await $_getPrefetchedData<
                      Product,
                      $ProductsTable,
                      Favourite
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableReferences
                          ._favouritesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).favouritesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.productId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (cartItemsRefs)
                    await $_getPrefetchedData<
                      Product,
                      $ProductsTable,
                      CartItem
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableReferences
                          ._cartItemsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).cartItemsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.productId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, $$ProductsTableReferences),
      Product,
      PrefetchHooks Function({
        bool category,
        bool favouritesRefs,
        bool cartItemsRefs,
      })
    >;
typedef $$FavouritesTableCreateCompanionBuilder =
    FavouritesCompanion Function({
      Value<int> productId,
      required DateTime addedAt,
    });
typedef $$FavouritesTableUpdateCompanionBuilder =
    FavouritesCompanion Function({
      Value<int> productId,
      Value<DateTime> addedAt,
    });

final class $$FavouritesTableReferences
    extends BaseReferences<_$AppDatabase, $FavouritesTable, Favourite> {
  $$FavouritesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.favourites.productId, db.products.id),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavouritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavouritesTable> {
  $$FavouritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavouritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavouritesTable> {
  $$FavouritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavouritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavouritesTable> {
  $$FavouritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavouritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavouritesTable,
          Favourite,
          $$FavouritesTableFilterComposer,
          $$FavouritesTableOrderingComposer,
          $$FavouritesTableAnnotationComposer,
          $$FavouritesTableCreateCompanionBuilder,
          $$FavouritesTableUpdateCompanionBuilder,
          (Favourite, $$FavouritesTableReferences),
          Favourite,
          PrefetchHooks Function({bool productId})
        > {
  $$FavouritesTableTableManager(_$AppDatabase db, $FavouritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FavouritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$FavouritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$FavouritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => FavouritesCompanion(productId: productId, addedAt: addedAt),
          createCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                required DateTime addedAt,
              }) => FavouritesCompanion.insert(
                productId: productId,
                addedAt: addedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$FavouritesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (productId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.productId,
                            referencedTable: $$FavouritesTableReferences
                                ._productIdTable(db),
                            referencedColumn:
                                $$FavouritesTableReferences
                                    ._productIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FavouritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavouritesTable,
      Favourite,
      $$FavouritesTableFilterComposer,
      $$FavouritesTableOrderingComposer,
      $$FavouritesTableAnnotationComposer,
      $$FavouritesTableCreateCompanionBuilder,
      $$FavouritesTableUpdateCompanionBuilder,
      (Favourite, $$FavouritesTableReferences),
      Favourite,
      PrefetchHooks Function({bool productId})
    >;
typedef $$CartItemsTableCreateCompanionBuilder =
    CartItemsCompanion Function({
      Value<int> productId,
      Value<int> quantity,
      required DateTime addedAt,
    });
typedef $$CartItemsTableUpdateCompanionBuilder =
    CartItemsCompanion Function({
      Value<int> productId,
      Value<int> quantity,
      Value<DateTime> addedAt,
    });

final class $$CartItemsTableReferences
    extends BaseReferences<_$AppDatabase, $CartItemsTable, CartItem> {
  $$CartItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.cartItems.productId, db.products.id),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CartItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CartItemsTable> {
  $$CartItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CartItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CartItemsTable> {
  $$CartItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CartItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartItemsTable> {
  $$CartItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CartItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CartItemsTable,
          CartItem,
          $$CartItemsTableFilterComposer,
          $$CartItemsTableOrderingComposer,
          $$CartItemsTableAnnotationComposer,
          $$CartItemsTableCreateCompanionBuilder,
          $$CartItemsTableUpdateCompanionBuilder,
          (CartItem, $$CartItemsTableReferences),
          CartItem,
          PrefetchHooks Function({bool productId})
        > {
  $$CartItemsTableTableManager(_$AppDatabase db, $CartItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CartItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CartItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CartItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => CartItemsCompanion(
                productId: productId,
                quantity: quantity,
                addedAt: addedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                required DateTime addedAt,
              }) => CartItemsCompanion.insert(
                productId: productId,
                quantity: quantity,
                addedAt: addedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CartItemsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (productId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.productId,
                            referencedTable: $$CartItemsTableReferences
                                ._productIdTable(db),
                            referencedColumn:
                                $$CartItemsTableReferences
                                    ._productIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CartItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CartItemsTable,
      CartItem,
      $$CartItemsTableFilterComposer,
      $$CartItemsTableOrderingComposer,
      $$CartItemsTableAnnotationComposer,
      $$CartItemsTableCreateCompanionBuilder,
      $$CartItemsTableUpdateCompanionBuilder,
      (CartItem, $$CartItemsTableReferences),
      CartItem,
      PrefetchHooks Function({bool productId})
    >;
typedef $$SyncMetaTableCreateCompanionBuilder =
    SyncMetaCompanion Function({
      required String key,
      Value<DateTime?> lastSyncAt,
      Value<int> categoriesCount,
      Value<int> productsCount,
      Value<int> rowid,
    });
typedef $$SyncMetaTableUpdateCompanionBuilder =
    SyncMetaCompanion Function({
      Value<String> key,
      Value<DateTime?> lastSyncAt,
      Value<int> categoriesCount,
      Value<int> productsCount,
      Value<int> rowid,
    });

class $$SyncMetaTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoriesCount => $composableBuilder(
    column: $table.categoriesCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productsCount => $composableBuilder(
    column: $table.productsCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoriesCount => $composableBuilder(
    column: $table.categoriesCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productsCount => $composableBuilder(
    column: $table.productsCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get categoriesCount => $composableBuilder(
    column: $table.categoriesCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get productsCount => $composableBuilder(
    column: $table.productsCount,
    builder: (column) => column,
  );
}

class $$SyncMetaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetaTable,
          SyncMetaData,
          $$SyncMetaTableFilterComposer,
          $$SyncMetaTableOrderingComposer,
          $$SyncMetaTableAnnotationComposer,
          $$SyncMetaTableCreateCompanionBuilder,
          $$SyncMetaTableUpdateCompanionBuilder,
          (
            SyncMetaData,
            BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>,
          ),
          SyncMetaData,
          PrefetchHooks Function()
        > {
  $$SyncMetaTableTableManager(_$AppDatabase db, $SyncMetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SyncMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SyncMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SyncMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<int> categoriesCount = const Value.absent(),
                Value<int> productsCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetaCompanion(
                key: key,
                lastSyncAt: lastSyncAt,
                categoriesCount: categoriesCount,
                productsCount: productsCount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<int> categoriesCount = const Value.absent(),
                Value<int> productsCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetaCompanion.insert(
                key: key,
                lastSyncAt: lastSyncAt,
                categoriesCount: categoriesCount,
                productsCount: productsCount,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetaTable,
      SyncMetaData,
      $$SyncMetaTableFilterComposer,
      $$SyncMetaTableOrderingComposer,
      $$SyncMetaTableAnnotationComposer,
      $$SyncMetaTableCreateCompanionBuilder,
      $$SyncMetaTableUpdateCompanionBuilder,
      (
        SyncMetaData,
        BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>,
      ),
      SyncMetaData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$FavouritesTableTableManager get favourites =>
      $$FavouritesTableTableManager(_db, _db.favourites);
  $$CartItemsTableTableManager get cartItems =>
      $$CartItemsTableTableManager(_db, _db.cartItems);
  $$SyncMetaTableTableManager get syncMeta =>
      $$SyncMetaTableTableManager(_db, _db.syncMeta);
}
