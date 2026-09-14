import 'package:get/get.dart';

import '../../data/repositories/favourite_repository.dart';
import 'favourites_controller.dart';

class FavouritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavouritesController>(
      () => FavouritesController(Get.find<FavouriteRepository>()),
    );
  }
}
