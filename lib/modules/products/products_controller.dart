import 'dart:async';

import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../data/local/database.dart';
import '../../data/remote/api_exception.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/repositories/sync_repository.dart';
import 'category_arg.dart';
import 'product_sort_option.dart';

/// requirements.md §6 — Products By Category: search, pull-to-refresh,
/// sort by price/rating are all applied in-memory over the Drift stream
/// (docs/architecture.md §5); only Refresh reaches the API, via
/// SyncRepository, never this controller calling Dio directly.
class ProductsController extends GetxController {
  ProductsController(
    this._productRepository,
    this._syncRepository,
    this.category,
  );

  final ProductRepository _productRepository;
  final SyncRepository _syncRepository;
  final CategoryArg category;

  final _allProducts = <Product>[].obs;
  final searchQuery = ''.obs;
  final sortOption = ProductSortOption.none.obs;
  final isLoading = true.obs;
  final RxnString refreshError = RxnString();

  StreamSubscription<List<Product>>? _subscription;

  @override
  void onInit() {
    super.onInit();
    _subscription = _productRepository.watchByCategory(category.slug).listen((rows) {
      _allProducts.assignAll(rows);
      isLoading.value = false;
    });
  }

  bool get hasAnyProducts => _allProducts.isNotEmpty;

  List<Product> get visibleProducts {
    var list = _allProducts.toList();

    final query = searchQuery.value.trim().toLowerCase();
    if (query.isNotEmpty) {
      list = list
          .where(
            (p) =>
                p.title.toLowerCase().contains(query) ||
                (p.brand ?? '').toLowerCase().contains(query),
          )
          .toList();
    }

    switch (sortOption.value) {
      case ProductSortOption.priceLowHigh:
        list.sort((a, b) => a.price.compareTo(b.price));
      case ProductSortOption.priceHighLow:
        list.sort((a, b) => b.price.compareTo(a.price));
      case ProductSortOption.ratingHighLow:
        list.sort((a, b) => b.rating.compareTo(a.rating));
      case ProductSortOption.ratingLowHigh:
        list.sort((a, b) => a.rating.compareTo(b.rating));
      case ProductSortOption.none:
        break;
    }
    return list;
  }

  void openDetails(Product product) {
    Get.toNamed(Routes.productDetails, arguments: product.id);
  }

  /// Pull-to-refresh — re-runs the same full sync Dashboard's "Refresh
  /// Data" uses, keeping the single API-call boundary in SyncRepository.
  Future<void> onRefresh() async {
    refreshError.value = null;
    try {
      await for (final _ in _syncRepository.syncAll()) {}
    } catch (e) {
      refreshError.value = e is ApiException ? e.message : 'Something went wrong.';
    }
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
