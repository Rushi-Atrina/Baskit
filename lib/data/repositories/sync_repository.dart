import 'dart:async';

import '../local/database.dart';
import '../remote/api_exception.dart';
import '../remote/dummyjson_api.dart';
import '../../services/connectivity_service.dart';
import 'sync_progress.dart';

/// requirements.md §2 (Initial Data Download) — the only place in the app
/// allowed to call the API (docs/architecture.md §1). Everything it fetches
/// is written to Drift before Categories/Products/Dashboard screens can see it.
class SyncRepository {
  SyncRepository(this._db, this._api, this._connectivity);

  final AppDatabase _db;
  final DummyJsonApi _api;
  final ConnectivityService _connectivity;

  Stream<SyncMetaData?> watchMeta() => _db.syncMetaDao.watch();

  Future<SyncMetaData?> getMeta() => _db.syncMetaDao.get();

  Future<bool> hasSyncedOnce() async {
    final meta = await getMeta();
    return meta?.lastSyncAt != null;
  }

  /// Downloads categories then products and writes both to Drift, emitting
  /// progress as it goes. Errors are delivered via the stream (as
  /// [ApiException]s) rather than thrown, so the UI's `listen(onError: ...)`
  /// is the single place that handles Retry.
  Stream<SyncProgress> syncAll() {
    final controller = StreamController<SyncProgress>();

    Future<void> run() async {
      if (!await _connectivity.hasConnection()) {
        throw const NoInternetException();
      }

      controller.add(const SyncProgress.categoriesStarted());
      final categories = await _api.getCategories();
      await _db.categoryDao.replaceAll(
        categories.map((c) => c.toCompanion()).toList(),
      );
      controller.add(const SyncProgress.categoriesCompleted());

      controller.add(const SyncProgress.productsProgress(0));
      final products = await _api.getProducts(
        limit: 200,
        onProgress: (percent) =>
            controller.add(SyncProgress.productsProgress(percent)),
      );
      await _db.productDao.replaceAll(
        products.map((p) => p.toCompanion()).toList(),
      );
      controller.add(const SyncProgress.productsCompleted());

      await _db.syncMetaDao.markSynced(
        categoriesCount: categories.length,
        productsCount: products.length,
      );
      controller.add(const SyncProgress.done());
    }

    run().catchError(controller.addError).whenComplete(controller.close);

    return controller.stream;
  }
}
