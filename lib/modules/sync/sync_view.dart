import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sync_controller.dart';

/// Non-dismissible per requirements.md §2 — no back navigation, no way to
/// skip past it until the initial download succeeds.
class SyncView extends GetView<SyncController> {
  const SyncView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Obx(() {
                if (controller.errorMessage.value != null) {
                  return _ErrorState(
                    message: controller.errorMessage.value!,
                    onRetry: controller.start,
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Setting up your data',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    _StepRow(
                      label: 'Downloading Categories...',
                      completed: controller.categoriesCompleted.value,
                    ),
                    const SizedBox(height: 20),
                    _StepRow(
                      label: 'Downloading Products...',
                      completed: controller.productsCompleted.value,
                      percent: controller.productsPercent.value,
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({required this.label, required this.completed, this.percent});

  final String label;
  final bool completed;
  final double? percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: completed
              ? const Icon(Icons.check_circle, color: Colors.green)
              : const CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label),
              if (!completed && percent != null) ...[
                const SizedBox(height: 4),
                Text(
                  '${percent!.clamp(0, 100).toStringAsFixed(0)}% Please wait...',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (completed)
                Text('Completed', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.cloud_off, size: 48, color: Theme.of(context).colorScheme.error),
        const SizedBox(height: 16),
        Text(message, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        FilledButton(onPressed: onRetry, child: const Text('Retry')),
      ],
    );
  }
}
