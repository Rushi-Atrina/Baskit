/// Emitted by [SyncRepository.syncAll] — mirrors the two-step download
/// dialog described in requirements.md §2:
///   "Downloading Categories... ✔ Completed"
///   "Downloading Products... 45% Please wait..."
enum SyncStep { categories, products, done }

class SyncProgress {
  const SyncProgress({required this.step, this.completed = false, this.percent});

  const SyncProgress.categoriesStarted() : this(step: SyncStep.categories);
  const SyncProgress.categoriesCompleted()
      : this(step: SyncStep.categories, completed: true);
  const SyncProgress.productsProgress(double percent)
      : this(step: SyncStep.products, percent: percent);
  const SyncProgress.productsCompleted()
      : this(step: SyncStep.products, completed: true);
  const SyncProgress.done() : this(step: SyncStep.done, completed: true);

  final SyncStep step;
  final bool completed;

  /// 0..100, only meaningful while step == products and !completed.
  final double? percent;
}
