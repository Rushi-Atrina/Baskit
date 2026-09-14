import 'package:get/get.dart';

import '../../data/local/database.dart';
import '../../data/remote/api_client.dart';
import '../../data/remote/dummyjson_api.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/cart_repository.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/favourite_repository.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/repositories/sync_repository.dart';
import '../../services/connectivity_service.dart';
import '../../services/google_auth_service.dart';

/// App-wide singletons, registered once at startup (GetMaterialApp's
/// `initialBinding`). See docs/architecture.md §1 for why everything routes
/// through AppDatabase/repositories rather than being reached for directly.
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppDatabase>(AppDatabase(), permanent: true);
    Get.put<ApiClient>(ApiClient(), permanent: true);
    Get.put<DummyJsonApi>(DummyJsonApi(Get.find()), permanent: true);
    Get.put<GoogleAuthService>(GoogleAuthService(), permanent: true);
    Get.put<ConnectivityService>(ConnectivityService(), permanent: true);

    Get.put<AuthRepository>(
      AuthRepository(Get.find(), Get.find()),
      permanent: true,
    );
    Get.put<SyncRepository>(
      SyncRepository(Get.find(), Get.find(), Get.find()),
      permanent: true,
    );
    Get.put<CategoryRepository>(CategoryRepository(Get.find()), permanent: true);
    Get.put<ProductRepository>(ProductRepository(Get.find()), permanent: true);
    Get.put<FavouriteRepository>(FavouriteRepository(Get.find()), permanent: true);
    Get.put<CartRepository>(CartRepository(Get.find()), permanent: true);
  }
}
