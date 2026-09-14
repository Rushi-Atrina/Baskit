import 'package:get/get.dart';

import '../../data/repositories/product_repository.dart';
import '../../data/repositories/sync_repository.dart';
import 'category_arg.dart';
import 'products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    final category = Get.arguments as CategoryArg;
    Get.lazyPut<ProductsController>(
      () => ProductsController(
        Get.find<ProductRepository>(),
        Get.find<SyncRepository>(),
        category,
      ),
    );
  }
}
