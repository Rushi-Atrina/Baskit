import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/widgets/product_card.dart';
import 'product_sort_option.dart';
import 'products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.category.name),
        actions: [
          Obx(
            () => PopupMenuButton<ProductSortOption>(
              icon: const Icon(Icons.sort),
              initialValue: controller.sortOption.value,
              onSelected: (option) => controller.sortOption.value = option,
              itemBuilder: (context) => ProductSortOption.values
                  .map((o) => PopupMenuItem(value: o, child: Text(o.label)))
                  .toList(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search products or brand',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (value) => controller.searchQuery.value = value,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.refreshError.value != null) {
                return _MessageState(
                  icon: Icons.cloud_off,
                  message: controller.refreshError.value!,
                );
              }

              if (!controller.hasAnyProducts) {
                return const _MessageState(
                  icon: Icons.inventory_2_outlined,
                  message: 'No products available.',
                );
              }

              final products = controller.visibleProducts;
              if (products.isEmpty) {
                return const _MessageState(
                  icon: Icons.search_off,
                  message: 'No matching products found.',
                );
              }

              return RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.62,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                      onTap: () => controller.openDetails(product),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _MessageState extends StatelessWidget {
  const _MessageState({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ListView so RefreshIndicator elsewhere in the tree still works if wrapped.
      children: [
        const SizedBox(height: 80),
        Icon(icon, size: 48, color: Theme.of(context).colorScheme.outline),
        const SizedBox(height: 12),
        Text(message, textAlign: TextAlign.center),
      ],
    );
  }
}
