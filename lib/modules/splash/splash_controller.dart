import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/sync_repository.dart';

/// Decides the first real screen purely from Drift state (no network),
/// so it works offline too (requirements.md "Offline Scenario"):
///   no user            -> Auth
///   user, never synced -> Sync
///   user, synced       -> Dashboard
class SplashController extends GetxController {
  SplashController(this._authRepository, this._syncRepository);

  final AuthRepository _authRepository;
  final SyncRepository _syncRepository;

  @override
  void onReady() {
    super.onReady();
    _decideInitialRoute();
  }

  Future<void> _decideInitialRoute() async {
    final user = await _authRepository.watchCurrentUser().first;
    if (user == null) {
      Get.offAllNamed(Routes.auth);
      return;
    }

    final synced = await _syncRepository.hasSyncedOnce();
    Get.offAllNamed(synced ? Routes.dashboard : Routes.sync);
  }
}
