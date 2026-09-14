import 'dart:async';

import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../data/local/database.dart';
import '../../data/repositories/category_repository.dart';
import '../products/category_arg.dart';

/// requirements.md §5 — reads exclusively from Drift.
class CategoriesController extends GetxController {
  CategoriesController(this._categoryRepository);

  final CategoryRepository _categoryRepository;

  final categories = <Category>[].obs;
  StreamSubscription<List<Category>>? _subscription;

  @override
  void onInit() {
    super.onInit();
    _subscription = _categoryRepository.watchAll().listen(categories.assignAll);
  }

  void openProducts(Category category) {
    Get.toNamed(
      Routes.products,
      arguments: CategoryArg(slug: category.slug, name: category.name),
    );
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
