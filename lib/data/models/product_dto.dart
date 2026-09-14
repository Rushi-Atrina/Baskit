import 'dart:convert';

import 'package:drift/drift.dart' show Value;

import '../local/database.dart';

/// GET /products?limit=200 → `products[]` row.
class ProductDto {
  const ProductDto({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.thumbnail,
    this.brand,
    this.discountPercentage = 0,
    this.rating = 0,
    this.stock = 0,
    this.images = const [],
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      brand: json['brand'] as String?,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      stock: json['stock'] as int? ?? 0,
      thumbnail: json['thumbnail'] as String,
      images: (json['images'] as List?)?.cast<String>() ?? const [],
    );
  }

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
  final List<String> images;

  ProductsCompanion toCompanion() {
    return ProductsCompanion.insert(
      id: Value(id),
      title: title,
      description: description,
      brand: Value(brand),
      category: category,
      price: price,
      discountPercentage: Value(discountPercentage),
      rating: Value(rating),
      stock: Value(stock),
      thumbnail: thumbnail,
      imagesJson: Value(jsonEncode(images)),
    );
  }
}
