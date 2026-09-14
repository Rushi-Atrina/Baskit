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

  /// [onProgress] reports 0..100 based on bytes received (requirements.md's
  /// "Downloading Products... 45%"); it's skipped if the server omits
  /// Content-Length.
  Future<List<ProductDto>> getProducts({
    int limit = 200,
    void Function(double percent)? onProgress,
  }) {
    return _client.guard((dio) async {
      final res = await dio.get<Map<String, dynamic>>(
        '/products',
        queryParameters: {'limit': limit},
        onReceiveProgress: (received, total) {
          if (total > 0 && onProgress != null) {
            onProgress((received / total) * 100);
          }
        },
      );
      final products = res.data!['products'] as List<dynamic>;
      return products
          .cast<Map<String, dynamic>>()
          .map(ProductDto.fromJson)
          .toList();
    });
  }
}
