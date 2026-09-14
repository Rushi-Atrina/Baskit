import 'dart:async';

import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../data/remote/api_exception.dart';
import '../../data/repositories/sync_progress.dart';
import '../../data/repositories/sync_repository.dart';

/// Drives the non-dismissible Initial Data Download screen
/// (requirements.md §2). Runs automatically on entry and on Retry.
class SyncController extends GetxController {
  SyncController(this._syncRepository);

  final SyncRepository _syncRepository;
  StreamSubscription<SyncProgress>? _subscription;

  final categoriesCompleted = false.obs;
  final productsPercent = 0.0.obs;
  final productsCompleted = false.obs;
  final errorMessage = RxnString();

  @override
  void onReady() {
    super.onReady();
    start();
  }

  void start() {
    categoriesCompleted.value = false;
    productsPercent.value = 0;
    productsCompleted.value = false;
    errorMessage.value = null;

    _subscription?.cancel();
    _subscription = _syncRepository.syncAll().listen(
          _onProgress,
          onError: _onError,
        );
  }

  void _onProgress(SyncProgress progress) {
    switch (progress.step) {
      case SyncStep.categories:
        categoriesCompleted.value = progress.completed;
      case SyncStep.products:
        if (progress.percent != null) {
          productsPercent.value = progress.percent!;
        }
        productsCompleted.value = progress.completed;
      case SyncStep.done:
        Get.offAllNamed(Routes.dashboard);
    }
  }

  void _onError(Object error) {
    errorMessage.value =
        error is ApiException ? error.message : 'Something went wrong.';
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
