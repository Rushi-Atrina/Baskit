import 'dart:async';

import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../data/local/database.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/product_repository.dart';
import '../products/category_arg.dart';

/// requirements.md §5 — reads exclusively from Drift.
class CategoriesController extends GetxController {
  CategoriesController(this._categoryRepository, this._productRepository);

  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  final categories = <Category>[].obs;
  final categoryThumbnails = <String, String>{}.obs;
  StreamSubscription<List<Category>>? _categoriesSubscription;
  StreamSubscription<Map<String, String>>? _thumbnailsSubscription;

  @override
  void onInit() {
    super.onInit();
    _categoriesSubscription =
        _categoryRepository.watchAll().listen(categories.assignAll);
    _thumbnailsSubscription = _productRepository
        .watchThumbnailByCategory()
        .listen(categoryThumbnails.assignAll);
  }

  void openProducts(Category category) {
    Get.toNamed(
      Routes.products,
      arguments: CategoryArg(slug: category.slug, name: category.name),
    );
  }

  @override
  void onClose() {
    _categoriesSubscription?.cancel();
    _thumbnailsSubscription?.cancel();
    super.onClose();
  }
}
