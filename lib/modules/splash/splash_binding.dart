import 'package:get/get.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/sync_repository.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Eager put, not lazyPut: SplashView's body never reads `controller`
    // (it's static UI), so a lazy binding would never actually resolve —
    // and with it, the onInit/onReady routing logic would never run.
    Get.put<SplashController>(
      SplashController(Get.find<AuthRepository>(), Get.find<SyncRepository>()),
    );
  }
}
