import 'package:get/get.dart';

import '../../data/repositories/sync_repository.dart';
import 'sync_controller.dart';

class SyncBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SyncController>(() => SyncController(Get.find<SyncRepository>()));
  }
}
