import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/app_theme.dart';
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
              icon: const Icon(Icons.tune_rounded),
              initialValue: controller.sortOption.value,
              onSelected: (option) => controller.sortOption.value = option,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              itemBuilder: (context) => ProductSortOption.values
                  .map((o) => PopupMenuItem(value: o, child: Text(o.label)))
                  .toList(),
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search products or brand',
                prefixIcon: Icon(Icons.search_rounded),
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
                  icon: Icons.cloud_off_rounded,
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
                  icon: Icons.search_off_rounded,
                  message: 'No matching products found.',
                );
              }

              return RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.56,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Obx(
                      () => ProductCard(
                        product: product,
                        onTap: () => controller.openDetails(product),
                        isFavourite: controller.favouriteIds.contains(product.id),
                        onToggleFavourite: () => controller.toggleFavourite(product.id),
                        cartQuantity: controller.cartQuantities[product.id] ?? 0,
                        onIncrement: () => controller.incrementCart(product.id),
                        onDecrement: () => controller.decrementCart(product.id),
                      ),
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
        const SizedBox(height: 96),
        Icon(icon, size: 48, color: AppColors.textSecondary),
        const SizedBox(height: 14),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
