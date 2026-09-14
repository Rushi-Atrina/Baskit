import 'package:get/get.dart';

import '../../data/repositories/category_repository.dart';
import 'categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(Get.find<CategoryRepository>()),
    );
  }
}
