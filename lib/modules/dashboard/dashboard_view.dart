import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/utils/date_formatter.dart';
import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  Future<void> _confirmDeleteAccount(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout and Delete Account?'),
        content: const Text(
          'This clears everything stored on this device — catalog, cart '
          'and favourites — and downloads it fresh next time you sign in.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await controller.logoutAndDeleteAccount();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Obx(() {
              final user = controller.user.value;
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: user?.photoUrl != null
                        ? NetworkImage(user!.photoUrl!)
                        : null,
                    child: user?.photoUrl == null
                        ? const Icon(Icons.person)
                        : null,
                  ),
                  title: Text(user?.name ?? '—'),
                  subtitle: Text(user?.email ?? ''),
                ),
              );
            }),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => _StatCard(
                      label: 'Categories',
                      value: '${controller.categoriesCount.value}',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Obx(
                    () => _StatCard(
                      label: 'Products',
                      value: '${controller.productsCount.value}',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Obx(() {
              final lastSync = controller.lastSyncAt.value;
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.sync),
                  title: const Text('Last Sync Date'),
                  subtitle: Text(lastSync != null ? formatDateTime(lastSync) : '—'),
                ),
              );
            }),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: controller.viewCategories,
              icon: const Icon(Icons.category),
              label: const Text('View Categories'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: controller.refreshData,
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh Data'),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: controller.logout,
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () => _confirmDeleteAccount(context),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              icon: const Icon(Icons.delete_forever),
              label: const Text('Logout and Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(value, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 4),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
