import 'package:get/get.dart';

import '../../data/repositories/cart_repository.dart';
import '../../data/repositories/favourite_repository.dart';
import '../../data/repositories/product_repository.dart';
import 'product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    final productId = Get.arguments as int;
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(
        Get.find<ProductRepository>(),
        Get.find<FavouriteRepository>(),
        Get.find<CartRepository>(),
        productId,
      ),
    );
  }
}
