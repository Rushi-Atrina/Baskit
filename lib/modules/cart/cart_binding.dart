import 'package:get/get.dart';

import '../../data/repositories/cart_repository.dart';
import 'cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(Get.find<CartRepository>()));
  }
}
