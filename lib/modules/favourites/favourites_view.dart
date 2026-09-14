import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/widgets/product_card.dart';
import 'favourites_controller.dart';

class FavouritesView extends GetView<FavouritesController> {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourites')),
      body: Obx(() {
        final products = controller.products;
        if (products.isEmpty) {
          return const Center(child: Text('No favourites yet.'));
        }
        return GridView.builder(
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
            return Stack(
              children: [
                ProductCard(
                  product: product,
                  onTap: () => controller.openDetails(product),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: _RemoveButton(onTap: () => controller.remove(product.id)),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}

class _RemoveButton extends StatelessWidget {
  const _RemoveButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.85),
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.favorite, color: Colors.red, size: 20),
        tooltip: 'Remove from favourites',
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
