import '../models/category_dto.dart';
import '../models/product_dto.dart';
import 'api_client.dart';

/// requirements.md §2 (Initial Data Download). Called only by
/// SyncRepository — never directly from a screen/controller.
class DummyJsonApi {
  DummyJsonApi(this._client);

  final ApiClient _client;

  Future<List<CategoryDto>> getCategories() {
    return _client.guard((dio) async {
      final res = await dio.get<List<dynamic>>('/products/categories');
      return res.data!
          .cast<Map<String, dynamic>>()
          .map(CategoryDto.fromJson)
          .toList();
    });
  }

  Future<List<ProductDto>> getProducts({int limit = 200}) {
    return _client.guard((dio) async {
      final res = await dio.get<Map<String, dynamic>>(
        '/products',
        queryParameters: {'limit': limit},
      );
      final products = res.data!['products'] as List<dynamic>;
      return products
          .cast<Map<String, dynamic>>()
          .map(ProductDto.fromJson)
          .toList();
    });
  }
}
