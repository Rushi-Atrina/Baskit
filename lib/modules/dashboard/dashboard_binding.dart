import 'package:get/get.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/repositories/sync_repository.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(
        Get.find<AuthRepository>(),
        Get.find<CategoryRepository>(),
        Get.find<ProductRepository>(),
        Get.find<SyncRepository>(),
      ),
    );
  }
}
