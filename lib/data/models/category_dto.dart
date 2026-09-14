import 'package:drift/drift.dart' show Value;

import '../local/database.dart';

/// GET /products/categories row: {"slug", "name", "url"}.
class CategoryDto {
  const CategoryDto({required this.slug, required this.name, this.url});

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      slug: json['slug'] as String,
      name: json['name'] as String,
      url: json['url'] as String?,
    );
  }

  final String slug;
  final String name;
  final String? url;

  CategoriesCompanion toCompanion() {
    return CategoriesCompanion.insert(
      slug: slug,
      name: name,
      url: Value(url),
    );
  }
}
