import 'dart:async';

import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../data/local/database.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/repositories/sync_repository.dart';

/// requirements.md §4 — everything here reads from Drift via repositories,
/// never the API (docs/architecture.md §1).
class DashboardController extends GetxController {
  DashboardController(
    this._authRepository,
    this._categoryRepository,
    this._productRepository,
    this._syncRepository,
  );

  final AuthRepository _authRepository;
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final SyncRepository _syncRepository;

  final Rxn<User> user = Rxn<User>();
  final categoriesCount = 0.obs;
  final productsCount = 0.obs;
  final Rxn<DateTime> lastSyncAt = Rxn<DateTime>();

  final List<StreamSubscription<dynamic>> _subscriptions = [];

  @override
  void onInit() {
    super.onInit();
    _subscriptions
      ..add(_authRepository.watchCurrentUser().listen((u) => user.value = u))
      ..add(
        _categoryRepository
            .watchAll()
            .listen((rows) => categoriesCount.value = rows.length),
      )
      ..add(
        _productRepository
            .watchAll()
            .listen((rows) => productsCount.value = rows.length),
      )
      ..add(
        _syncRepository
            .watchMeta()
            .listen((meta) => lastSyncAt.value = meta?.lastSyncAt),
      );
  }

  void viewCategories() => Get.toNamed(Routes.categories);

  /// Re-runs the full Initial Sync flow (requirements.md §4 "Refresh Data").
  void refreshData() => Get.toNamed(Routes.sync);

  Future<void> logout() async {
    await _authRepository.signOut();
    Get.offAllNamed(Routes.auth);
  }

  Future<void> logoutAndDeleteAccount() async {
    await _authRepository.signOutAndDeleteAccount();
    Get.offAllNamed(Routes.auth);
  }

  @override
  void onClose() {
    for (final s in _subscriptions) {
      s.cancel();
    }
    super.onClose();
  }
}
